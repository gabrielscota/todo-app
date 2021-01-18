import 'package:flutter/material.dart';

import '../../mixins/mixins.dart';
import './splash.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final SplashPresenter presenter;

  SplashPage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.loadTasks();

    return Scaffold(
      body: Builder(
        builder: (context) {
          handleNavigation(presenter.navigateToStream, clear: true);

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
