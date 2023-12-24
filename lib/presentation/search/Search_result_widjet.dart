import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

import 'package:netflix_app/presentation/widjets/text_tittle_widjet.dart';

final imageUrlVertival =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/7NAvPYPAu7MeHwP8E9sn81PqsRh.jpg";

class SearchresultWidjet extends StatelessWidget {
  const SearchresultWidjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTittleWidjet(textTittle: 'Movies & T V'),
          kheight,
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.1 / 1.6,
              children: List.generate(20, (index) {
                return const MainCard();
              }),
            ),
          )
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrlVertival), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(7))),
    );
  }
}
