import 'package:flutter/material.dart';
// height and widths

const kwidth = SizedBox(width: 25);
const kheight = SizedBox(height: 10);
const kheight5 = SizedBox(height: 5);
const kheight20 = SizedBox(
  height: 20,
);
const kheight50 = SizedBox(
  height: 50,
);

//borderradius
const BorderRadius kborderRadius = BorderRadius.all(Radius.circular(10));

// button style
final kbuttonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.white),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
);

// image hot and news
const imagetile =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/yKAg8z8T1iXeYA0Io3E4u9mchdt.jpg";
//assets images

const knetflixlogo =
    "https://duet-cdn.vox-cdn.com/thumbor/0x0:3151x2048/750x500/filters:focal(1575x1024:1576x1025):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png";

// images
const kmainBackgrounImage =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tjX3FRx21emmwA30QwXaU39mHoT.jpg";

// tmdb APi image baseurl
const imageAppendurl = "https://image.tmdb.org/t/p/w500/";
