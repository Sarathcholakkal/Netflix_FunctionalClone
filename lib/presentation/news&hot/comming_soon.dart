import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/news&hot/widjets/icontile.dart';
import 'package:netflix_app/presentation/news&hot/widjets/videoWidjet.dart';

class ScreenComingSoon extends StatelessWidget {
  final String month;
  final String day;
  final int id;
  final String movieName;
  final String posterPath;
  final String movieDiscription;

  const ScreenComingSoon(
      {super.key,
      required this.month,
      required this.day,
      required this.id,
      required this.movieName,
      required this.posterPath,
      required this.movieDiscription});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kheight,
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: 50,
              child: Column(
                children: [
                  Text(
                    month,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
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
                  VideoWidjet(videoUrl: posterPath),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: GoogleFonts.julee().fontFamily,
                              letterSpacing: .1),
                        ),
                      ),
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
                  Text(
                    'Comming on $month $day',
                    style: const TextStyle(
                        color: kgreycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  kheight20,
                  Text(
                    movieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: .5),
                  ),
                  Text(
                    movieDiscription,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
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
