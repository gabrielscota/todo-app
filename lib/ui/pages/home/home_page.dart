import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';
import './components/components.dart';
import './home.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({@required this.presenter});

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigationManager {
  bool isAddingTask = false;
  FocusNode focusNode = FocusNode();

  void handleAddingTask({bool value}) {
    setState(() => isAddingTask = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 252, 252, 1.0),
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
                  child: ElevatedButton(
                    onPressed: widget.presenter.loadTasksData,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'Recarregar',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(25, 44, 93, 1.0),
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
                        physics: const NeverScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyAppBar(),
                              const Name(),
                              if (snapshot.data != null) const Projects(),
                              if (snapshot.data != null)
                                Tasks(presenter: widget.presenter)
                              else
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32.0, vertical: 64.0),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'lib/ui/assets/illustrations/add_notes.svg',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 24.0),
                                          child: Text(
                                            R.string.emptyTasks,
                                            style: GoogleFonts.quicksand(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  110, 119, 142, 1.0),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: focusNode.requestFocus,
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          child: Text(
                                            'Criar nova tarefa',
                                            style: GoogleFonts.quicksand(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  42, 92, 222, 1.0),
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
                          duration: const Duration(milliseconds: 200),
                          opacity: isAddingTask ? 1.0 : 0.0,
                          child: Visibility(
                            visible: isAddingTask,
                            child: Container(
                              decoration: const BoxDecoration(
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
                        child: AddTask(
                          presenter: widget.presenter,
                          handleAddingTask: handleAddingTask,
                          focusNode: focusNode,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
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
