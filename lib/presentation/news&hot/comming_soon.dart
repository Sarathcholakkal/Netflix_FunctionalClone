import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/news&hot/widjets/icontile.dart';
import 'package:netflix_app/presentation/news&hot/widjets/videoWidjet.dart';

class ScreenComingSoon extends StatelessWidget {
  const ScreenComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kheight,
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 500,
              width: 50,
              child: Column(
                children: [
                  Text(
                    'FEB',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    '11',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.width - 50,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoWidjet(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'TALLGIRl2',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: GoogleFonts.julee().fontFamily,
                            letterSpacing: .1),
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          IconTile(
                              tittle: 'remind me',
                              icon: Icons.notifications_active_outlined),
                          IconTile(tittle: 'info', icon: Icons.info_outline)
                        ],
                      )
                    ],
                  ),
                  const Text(
                    'Comming on Friday',
                    style: TextStyle(
                        color: kgreycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  kheight20,
                  const Text(
                    'TallGirl2',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: .5),
                  ),
                  const Text(
                    'Landing the lead in the school  musical is a dream come true for Jodi,  until the pressure sends her confidence - and her relationship -into tailspin',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
