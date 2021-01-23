import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../mixins/mixins.dart';
import './components/components.dart';
import './home.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  HomePage({@required this.presenter});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigationManager {
  bool isAddingTask = false;

  void handleAddingTask(bool value) {
    setState(() => isAddingTask = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1.0),
      body: Builder(
        builder: (context) {
          handleNavigation(widget.presenter.navigateToStream, clear: true);
          widget.presenter.loadTasksData();
          widget.presenter.loadProjectsData();

          return StreamBuilder<List<TaskViewModel>>(
            stream: widget.presenter.tasksStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: RaisedButton(
                    onPressed: widget.presenter.loadTasksData,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'Recarregar',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(25, 44, 93, 1.0),
                        ),
                      ),
                    ),
                  ),
                );
              }

              if (snapshot.hasData || snapshot.data == null) {
                return Provider(
                  create: (_) => widget.presenter,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MyAppBar(),
                              Name(),
                              snapshot.data != null ? Projects() : SizedBox(),
                              snapshot.data != null
                                  ? Tasks(presenter: widget.presenter)
                                  : Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32.0, vertical: 64.0),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                              'lib/ui/assets/illustrations/add_notes.svg',
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 24.0),
                                              child: Text(
                                                'Parece que você ainda não tem nenhuma tarefa, que tal criarmos a primeira?',
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      25, 44, 93, 1.0),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: Navigator.of(context).focusScopeNode.unfocus,
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: isAddingTask ? 1.0 : 0.0,
                          child: Visibility(
                            visible: isAddingTask,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(252, 252, 252, 0.7),
                                    Color.fromRGBO(252, 252, 252, 1.0),
                                  ],
                                  stops: [0.5, 0.75],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: AddTask(handleAddingTask: handleAddingTask),
                      ),
                    ],
                  ),
                );
              }

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(58, 58, 58, 1.0),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
