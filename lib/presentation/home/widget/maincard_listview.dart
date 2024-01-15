import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widget/maincard.dart';
import 'package:netflix_app/presentation/widjets/text_tittle_widjet.dart';

class MaincardListview extends StatelessWidget {
  final String mainlistTittle;
  final List<String> listofposters;
  const MaincardListview(
      {super.key, required this.mainlistTittle, required this.listofposters});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TextTittleWidjet(textTittle: mainlistTittle),
            ),
            // kheight5,
            LimitedBox(
              maxHeight: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  listofposters.length,
                  (index) {
                    // log(listofposters[index]);
                    return MainCardinHome(
                      postepathmaincard: listofposters[index],
                    );
                  }
                  //  const Containerwidjet()
                  ,
                ),
              ),
            )
          ],
        ));
  }
}
