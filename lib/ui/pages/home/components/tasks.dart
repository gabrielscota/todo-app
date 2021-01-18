import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './components.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, top: 16.0, right: 24.0, bottom: 8.0),
          child: Text(
            'Suas tarefas',
            style: GoogleFonts.quicksand(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(25, 44, 93, 1.0),
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
          child: Column(
            children: [
              TaskTile(),
              TaskTile(),
              TaskTile(),
            ],
          ),
        ),
      ],
    );
  }
}
