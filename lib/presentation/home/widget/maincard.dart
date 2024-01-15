import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

class MainCardinHome extends StatelessWidget {
  final String postepathmaincard;
  const MainCardinHome({super.key, required this.postepathmaincard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        // height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: kborderRadius,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(postepathmaincard),
          ),
        ),
      ),
    );
  }
}
//
//
