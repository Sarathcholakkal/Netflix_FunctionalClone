import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constant.dart';

Stack HomeMainSheet() {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: 600,
        // color: Colors.red,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(kmainBackgrounImage),
          ),
        ),
      ),
      //
      //

      Positioned(
        bottom: 5,
        right: 0,
        left: 0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconTile(icon: Icons.add, iconName: 'My List'),
              textbuttonTile(),
              iconTile(icon: Icons.info_outline_rounded, iconName: 'info')
            ],
          ),
        ),
      ),
    ],
  );
}

Column iconTile({required IconData icon, required String iconName}) {
  return Column(
    children: [
      Icon(
        icon,
        color: kwhitecolor,
      ),
      Text(iconName)
    ],
  );
}

TextButton textbuttonTile() {
  return TextButton.icon(
      onPressed: () {},
      style: kbuttonStyle,
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: KblackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(
              color: KblackColor, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ));
}
