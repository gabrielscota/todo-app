import 'package:flutter/material.dart';

import '../../mixins/mixins.dart';
import './components/components.dart';
import './home.dart';

class HomePage extends StatelessWidget with NavigationManager {
  final HomePresenter presenter;

  HomePage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1.0),
      body: Builder(
        builder: (context) {
          handleNavigation(presenter.navigateToStream, clear: true);

          return SingleChildScrollView(
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
                  AddTask(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
