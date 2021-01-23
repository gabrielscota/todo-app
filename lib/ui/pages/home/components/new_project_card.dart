import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shadowColor: const Color.fromRGBO(58, 58, 58, 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Color.fromRGBO(25, 44, 93, 1.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            color: Color.fromRGBO(25, 44, 93, 1.0),
            size: 32.0,
          ),
          Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              'Criar novo projeto',
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(25, 44, 93, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
