import 'package:flutter/material.dart';

import 'package:netflix_app/core/constant.dart';

class AppBarWidjet extends StatelessWidget {
  const AppBarWidjet({super.key, required this.tittle});
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Text(
                tittle,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kwidth,
              Container(
                height: 30,
                width: 30,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
