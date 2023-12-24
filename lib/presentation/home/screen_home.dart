import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix_app/core/constant.dart';

import 'package:netflix_app/presentation/home/widget/home_main_sheet.dart';

import 'package:netflix_app/presentation/home/widget/maincard_listview.dart';

import 'package:netflix_app/presentation/home/widget/numbercard_listView.dart';

final ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (ctx, scrollvalue, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                // print(direction);
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          //

                          //
                          HomeMainSheet(),
                          // LIstview horizontal section

                          const MaincardListview(
                              mainlistTittle: "Released in the past year"),
                          const MaincardListview(
                              mainlistTittle: "Trending Now "),
                          const NumbercardListView(
                              mainlistTittle: "Top 10 TV shows in India Today"),
                          const MaincardListview(mainlistTittle: "Tense drama"),
                          const MaincardListview(
                              mainlistTittle: "south indian movies")
                        ],
                      ),
                    ),
                    scrollvalue ? topinvicibleContainer() : kheight
                  ],
                ),
              ),
            );
          }),
    );
  }

  AnimatedContainer topinvicibleContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      width: double.infinity,
      height: 90,
      color: Colors.black.withOpacity(0.3),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                knetflixlogo,
                height: 50,
                width: 50,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              topText(textname: 'TV Shows'),
              topText(textname: 'Movies'),
              topText(textname: 'Categories')
            ],
          ),
        ],
      ),
    );
  }
}

//
Text topText({required String textname}) {
  return Text(
    textname,
    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  );
}

///
///
///
///
///
//
//
