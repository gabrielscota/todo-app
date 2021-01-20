import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.menu_rounded,
              size: 24,
              color: Color.fromRGBO(25, 44, 93, 1.0),
            ),
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
          ),
          Column(
            children: [
              Text(
                'Sábado',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(25, 44, 93, 1.0),
                ),
              ),
              Text(
                '15 de janeiro de 2020',
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(110, 119, 142, 1.0),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.calendar_today_rounded,
              size: 24,
              color: Color.fromRGBO(25, 44, 93, 1.0),
            ),
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
          ),
        ],
      ),
    );
  }
}
