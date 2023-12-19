import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

class VideoWidjet extends StatelessWidget {
  const VideoWidjet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imagetile,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(.7),
            radius: 25,
            child: const Icon(
              CupertinoIcons.speaker_3,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
