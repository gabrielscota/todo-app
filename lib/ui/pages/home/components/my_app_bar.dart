import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10,
                  color: Color.fromRGBO(58, 58, 58, 0.05),
                ),
              ],
            ),
            child: SvgPicture.asset(
              'lib/ui/assets/icons/menu.svg',
              height: 24,
              width: 24,
              color: const Color.fromRGBO(25, 44, 93, 1.0),
            ),
          ),
          Column(
            children: [
              Text(
                'Sábado',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(25, 44, 93, 1.0),
                ),
              ),
              Text(
                '15 de janeiro de 2020',
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(110, 119, 142, 1.0),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10,
                  color: Color.fromRGBO(58, 58, 58, 0.05),
                ),
              ],
            ),
            child: SvgPicture.asset(
              'lib/ui/assets/icons/calendar.svg',
              height: 24,
              width: 24,
              color: const Color.fromRGBO(25, 44, 93, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
