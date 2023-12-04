import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final index;
  const VideoListItem({super.key, this.index});
  final imageprofile =
      "https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(.7),
                radius: 30,
                child: Icon(
                  CupertinoIcons.speaker_3,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(imageprofile),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 2,
                        child: Text(
                          'NAME',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  VideoActionWidjets(tittle: 'LOL', icon: Icons.emoji_emotions),
                  VideoActionWidjets(tittle: 'MyList', icon: Icons.add),
                  VideoActionWidjets(
                    tittle: 'Share',
                    icon: Icons.arrow_back_ios_new_sharp,
                  ),
                  VideoActionWidjets(
                      tittle: 'Play', icon: CupertinoIcons.play_fill),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionWidjets extends StatelessWidget {
  final tittle;
  final icon;
  const VideoActionWidjets(
      {super.key, required this.tittle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolor,
            size: 30,
          ),
          Text(
            tittle,
            style: TextStyle(
                color: kwhitecolor, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
