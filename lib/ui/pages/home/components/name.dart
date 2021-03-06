import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Name extends StatelessWidget {
  const Name({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Olá, Gabriel',
            style: GoogleFonts.quicksand(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(25, 44, 93, 1.0),
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 4.0),
          Text(
            'Você tem 3 tarefas para hoje',
            style: GoogleFonts.quicksand(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(110, 119, 142, 1.0),
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
