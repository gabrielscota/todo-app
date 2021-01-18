import 'package:flutter/material.dart';

import '../../mixins/mixins.dart';
import './home.dart';

class HomePage extends StatelessWidget with NavigationManager {
  final HomePresenter presenter;

  HomePage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToDo')),
      body: Builder(
        builder: (context) {
          handleNavigation(presenter.navigateToStream, clear: true);

          return Center(
            child: Text('ToDo'),
          );
        },
      ),
    );
  }
}
