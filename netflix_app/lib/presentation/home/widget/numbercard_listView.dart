import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widget/numbercard.dart';
import 'package:netflix_app/presentation/widjets/text_tittle_widjet.dart';

class NumbercardListView extends StatelessWidget {
  final String mainlistTittle;
  const NumbercardListView({super.key, required this.mainlistTittle});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
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
                    10,
                    (index) =>
                        //  const Containerwidjet()
                        // MainCardinHome(),
                        NumberCard(index: index)),
              ),
            )
          ],
        ));
  }
}
