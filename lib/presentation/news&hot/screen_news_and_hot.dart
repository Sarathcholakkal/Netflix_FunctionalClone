import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/HotandNew/hotand_new_bloc.dart';

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
              child: hotandnewappbar()), // tab controller defined here
          body: TabBarView(
            children: [
              CommingsoonTabview(),
              _buildrgscreennew(),
            ],
          )),
    );
  }

  Widget _buildrgscreennew() {
    return ListView.builder(
      itemBuilder: (context, index) => const EveryOneIsWatching(
          movieName: 'name',
          movieDiscription: 'discription',
          posterPath: 'posterpath'),
      itemCount: 10,
    );
  }
  //
  //
}

class CommingsoonTabview extends StatelessWidget {
  const CommingsoonTabview({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotandNewBloc>(context).add(const Getdataincommingsoon());
    });

    return BlocBuilder<HotandNewBloc, HotandNewState>(
      builder: (context, state) {
        log(state.commingsoon.toString());
        if (state.isloading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text("error while loading"),
          );
        } else if (state.commingsoon.isEmpty) {
          return const Center(
            child: Text("Fetched data is empty"),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movieElementData = state.commingsoon[index];
              log(movieElementData.posterPath.toString());

              if (movieElementData.id == null) {
                return const SizedBox();
              } else {
                return ScreenComingSoon(
                    month: 'feb',
                    day: '23',
                    id: movieElementData.id!,
                    movieName: movieElementData.originalTitle ?? '',
                    posterPath: "$imageCache${movieElementData.posterPath}",
                    movieDiscription: movieElementData.overview ?? '');
              }
            },
            itemCount: 10,
          );
        }
      },
    );
  }
}
