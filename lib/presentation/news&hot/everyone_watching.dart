import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/news&hot/widjets/icontile.dart';
import 'package:netflix_app/presentation/news&hot/widjets/videoWidjet.dart';

class EveryOneIsWatching extends StatelessWidget {
  const EveryOneIsWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return const LimitedBox(
      maxWidth: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight20,
          Text(
            'TallGirl2',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: .5),
          ),
          kheight,
          Text(
            'Landing the lead in the school  musical is a dream come true for Jodi,  until the pressure sends her confidence - and her relationship -into tailspin',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          kheight50,
          VideoWidjet(),
          kheight,
          Row(
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
