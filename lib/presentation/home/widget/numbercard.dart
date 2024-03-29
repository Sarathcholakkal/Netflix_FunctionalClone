import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

class NumberCard extends StatelessWidget {
  final String numbercardposterpath;
  const NumberCard({
    super.key,
    required this.index,
    required this.numbercardposterpath,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              Container(
                // height: 200,
                width: 150,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: kborderRadius,
                  color: Colors.blueAccent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      // "https://image.tmdb.org/t/p/w500/uDCeELWWpsNq7ErM61Yuq70WAE9.jpg",

                      numbercardposterpath,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -57,
            left: -15,
            child: BorderedText(
              strokeWidth: 5.0,
              strokeColor: Colors.white,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontSize: 170,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
