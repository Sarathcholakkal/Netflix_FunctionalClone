import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/downloads/screen_download.dart';
import 'package:netflix_app/presentation/fast_laugh/screen_fastlaugh.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widjets/bottam_nav.dart';
import 'package:netflix_app/presentation/news&hot/screen_news_and_hot.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = const [
    ScreenHome(),
    ScreenNewsandHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: backgroundcolornetflix,// this propertie donot effect all app,only effect main page so give background value in scaffold  background
        body: ValueListenableBuilder(
            valueListenable: indexchangenotifier,
            builder: (context, newindex, _) {
              return _pages[newindex];
            }),
        bottomNavigationBar: BottamNavBar());
  }
}
