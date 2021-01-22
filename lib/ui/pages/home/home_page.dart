import 'package:flutter/material.dart';

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

          return Stack(
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MyAppBar(),
                      Name(),
                      Projects(),
                      Tasks(),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.18),
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
          );
        },
      ),
    );
  }
}
