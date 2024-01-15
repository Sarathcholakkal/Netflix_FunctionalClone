import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/news&hot/widjets/icontile.dart';
import 'package:netflix_app/presentation/news&hot/widjets/videoWidjet.dart';

class EveryOneIsWatching extends StatelessWidget {
  final String movieName;
  final String movieDiscription;
  final String posterPath;

  EveryOneIsWatching(
      {super.key,
      required this.movieName,
      required this.movieDiscription,
      required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight20,
          Text(
            movieName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: .5),
          ),
          kheight,
          Text(
            movieDiscription,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          kheight50,
          VideoWidjet(videoUrl: posterPath),
          kheight,
          const Row(
            children: [
              Spacer(),
              IconTile(
                  tittle: 'share', icon: Icons.send_outlined, iconsize: 40),
              IconTile(tittle: 'My List', icon: Icons.add, iconsize: 40),
              IconTile(
                tittle: 'Play',
                icon: Icons.play_arrow,
                iconsize: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}
