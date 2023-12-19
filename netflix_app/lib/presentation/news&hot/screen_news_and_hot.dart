import 'package:flutter/material.dart';

import 'package:netflix_app/presentation/news&hot/comming_soon.dart';
import 'package:netflix_app/presentation/news&hot/everyone_watching.dart';
import 'package:netflix_app/presentation/news&hot/widjets/hot_and_new_appBar.dart';

class ScreenNewsandHot extends StatelessWidget {
  const ScreenNewsandHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: hotandnewappbar()),
          body: TabBarView(
            children: [
              // ScreenComingSoon(),
              _buildcommingSoon(),
              _buildrgscreennew(),
            ],
          )),
    );
  }

  //
  //

  Widget _buildcommingSoon() {
    return ListView.builder(
      itemBuilder: (context, index) => const ScreenComingSoon(),
      itemCount: 10,
    );
  }

  //)
  //
  //
  //

  Widget _buildrgscreennew() {
    return ListView.builder(
      itemBuilder: (context, index) => const EveryOneIsWatching(),
      itemCount: 10,
    );
  }
  //
  //
}
