import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constant.dart';

AppBar hotandnewappbar() {
  return AppBar(
    elevation: 0,
    title: const Text(
      'New & Hot',
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: kwhitecolor),
    ),
    actions: [
      const Icon(
        Icons.cast,
        color: Colors.white,
        size: 30,
      ),
      kwidth,
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          height: 30,
          width: 30,
          color: Colors.blue,
        ),
      ),
    ],
    bottom: TabBar(
        // indicatorColor: null,
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: kwhitecolor,
        indicator: BoxDecoration(
          color: kwhitecolor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
        ),
        // labelPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1\),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        tabs: const [
          Tab(
            text: "  🍿 Comming Soon     ",
          ),
          Tab(
            text: "     😎 Everyone is Watching   ",
          ),
        ]),
  );
}
