import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widget/numbercard.dart';
import 'package:netflix_app/presentation/widjets/text_tittle_widjet.dart';

class NumbercardListView extends StatelessWidget {
  final String mainlistTittle;
  final List<String> posterlist;
  const NumbercardListView({
    super.key,
    required this.mainlistTittle,
    required this.posterlist,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
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
                  // 10,
                  posterlist.length,
                  (index) =>
                      //  const Containerwidjet()
                      // MainCardinHome(),
                      NumberCard(
                    index: index,
                    numbercardposterpath: posterlist[index],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
