import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/widjets/text_tittle_widjet.dart';

final String imageUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/7RySzFeK3LPVMXcPtqfZnl6u4p1.jpg";

class SearchIdelWidjet extends StatelessWidget {
  const SearchIdelWidjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        TextTittleWidjet(textTittle: 'Top Searches'),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, inex) => kheight,
              itemCount: 20),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * .33,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: const Text(
              'MOVE NAMES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
            width: 60.0, // Adjust the size as needed
            height: 60.0, // Adjust the size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
              color: Colors.black,
            ),
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 40.0, // Adjust the size as needed
              ),
            ))
      ],
    );
  }
}
