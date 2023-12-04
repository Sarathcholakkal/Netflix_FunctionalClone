import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constant.dart';

class TextTittleWidjet extends StatelessWidget {
  final String textTittle;

  const TextTittleWidjet({super.key, required this.textTittle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight,
        Text(
          textTittle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kwhitecolor,
          ),
        ),
      ],
    );
  }
}
