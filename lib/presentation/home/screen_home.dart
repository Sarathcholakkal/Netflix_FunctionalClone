import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home_screen/homescreen_bloc.dart';

import 'package:netflix_app/core/constant.dart';

import 'package:netflix_app/presentation/home/widget/home_main_sheet.dart';

import 'package:netflix_app/presentation/home/widget/maincard_listview.dart';

import 'package:netflix_app/presentation/home/widget/numbercard_listView.dart';

final ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomescreenBloc>(context)
          .add(const getHomescreendataEvent());
    });
    //

    // BlocProvider.of<HomescreenBloc>(context)
    //     .add(const getHomescreendataEvent());
    return BlocBuilder<HomescreenBloc, HomescreenState>(
        builder: (context, state) {
      if (state.isloading) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      } else if (state.iserror) {
        return const Center(
          child: Text(
            "Error while getting data",
            style: TextStyle(color: Colors.white),
          ),
        );
      }
      ////////////////////////////////////////////////
      //? convering object list to string list.
      final _pastyear = state.pastyearmoveilist.map(
        (e) {
          return "$imageAppendurl${e.posterPath}";
        },
      ).toList();
      final _trendingnow = state.trendingnowlist.map(
        (e) {
          return "$imageAppendurl${e.posterPath}";
        },
      ).toList();
      _trendingnow.shuffle();
      final _tensdrama = state.tensdramalist.map((e) {
        return "$imageAppendurl${e.posterPath}";
      }).toList();
      _tensdrama.shuffle();
      _tensdrama.shuffle();
      _tensdrama.shuffle();
      _tensdrama.shuffle();
      //
      final _southindaia = state.southindanmovieslist.map((e) {
        return "$imageAppendurl${e.posterPath}";
      }).toList();
      _southindaia.shuffle();
      _southindaia.shuffle();

      ////////////
      log(state.toptentvshowlist.length.toString());
      final _toptentvlist = state.toptentvshowlist.map((e) {
        return "$imageAppendurl${e.posterPath}";
      }).toList();

      //////////////////////////////////////////////////
      // log(state.toptentvshowlist.length.toString());
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

                            MaincardListview(
                              mainlistTittle: "Released in the past year",
                              listofposters: _pastyear,
                            ),
                            MaincardListview(
                              mainlistTittle: "Trending Now ",
                              listofposters: _trendingnow,
                            ),
                            NumbercardListView(
                              mainlistTittle: "Top 10 TV shows in India Today",
                              posterlist: _toptentvlist,
                            ),
                            MaincardListview(
                              mainlistTittle: "Tense drama",
                              listofposters: _tensdrama,
                            ),
                            MaincardListview(
                              mainlistTittle: "south indian movies",
                              listofposters: _southindaia,
                            )
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
    });
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
