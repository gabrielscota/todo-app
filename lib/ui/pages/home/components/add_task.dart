import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Color.fromRGBO(58, 58, 58, 0.05),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 32.0, 12.0),
            child: Text(
              'Adicione uma nova tarefa',
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(110, 119, 142, 1.0),
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 8.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Color.fromRGBO(58, 58, 58, 0.05),
                ),
              ],
            ),
            child: Icon(
              Icons.short_text_rounded,
              size: 24.0,
              color: Color.fromRGBO(58, 58, 58, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
