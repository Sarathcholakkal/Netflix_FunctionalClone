import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoWidjet extends StatelessWidget {
  final String videoUrl;
  const VideoWidjet({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            videoUrl,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return const Center(
                child: Icon(Icons.wifi),
              );
            },
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
            },
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
