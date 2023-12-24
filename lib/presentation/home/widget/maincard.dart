import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

class MainCardinHome extends StatelessWidget {
  MainCardinHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        // height: 200,
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: kborderRadius,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg"),
          ),
        ),
      ),
    );
  }
}
//
//
