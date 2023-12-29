import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fastandlaugh/fastandlaugh_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/fast_laugh/screen_fastlaugh.dart';
import 'package:video_player/video_player.dart';
import 'dart:core';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    //avatar section declearaions
    final posterpath = VideoListItemInherited.of(context)?.movieData;
    final temp = posterpath!.posterPath;
    String temvar = "$imageAppendurl$temp";
    // print(temvar);
    //video section declearations
    final tempVideoUrl = videoDummiUrl[index % videoDummiUrl.length];

    return Stack(
      children: [
        FastandLaughVideoPlayer(
            videoUrl: tempVideoUrl, onstateOfvideochange: (bool) {}),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(.7),
                radius: 30,
                child: const Icon(
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
                              image: NetworkImage(temvar), fit: BoxFit.cover),
                        ),
                      ),
                      const Positioned(
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
                  const VideoActionWidjets(
                      tittle: 'LOL', icon: Icons.emoji_emotions),
                  const VideoActionWidjets(tittle: 'MyList', icon: Icons.add),
                  const VideoActionWidjets(
                    tittle: 'Share',
                    icon: Icons.arrow_back_ios_new_sharp,
                  ),
                  const VideoActionWidjets(
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
  final String tittle;
  final IconData icon;
  const VideoActionWidjets(
      {super.key, required this.tittle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolor,
            size: 30,
          ),
          Text(
            tittle,
            style: const TextStyle(
                color: kwhitecolor, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class FastandLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onstateOfvideochange;
  const FastandLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onstateOfvideochange});

  @override
  State<FastandLaughVideoPlayer> createState() =>
      _FastandLaughVideoPlayerState();
}

class _FastandLaughVideoPlayerState extends State<FastandLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) {
            setState(() {
              _videoPlayerController.play();
            });
          });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController))
          : const Center(
              child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
