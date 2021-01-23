import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './components.dart';

class Projects extends StatelessWidget {
  const Projects({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
          child: Text(
            'Seus projetos',
            style: GoogleFonts.quicksand(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(25, 44, 93, 1.0),
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 140,
              enlargeCenterPage: true,
              viewportFraction: 0.65,
              enableInfiniteScroll: false,
            ),
            items: [
              ProjectCard(),
              NewProjectCard(),
            ],
          ),
        ),
      ],
    );
  }
}
