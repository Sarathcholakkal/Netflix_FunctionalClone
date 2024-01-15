import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/HotandNew/hotand_new_bloc.dart';
import 'package:netflix_app/core/constant.dart';

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
          body: const TabBarView(
            children: [CommingsoonTabview(), EveryoneiswatchingTabview()],
          )),
    );
  }

  // Widget _buildrgscreennew() {
  //   return ListView.builder(
  //     itemBuilder: (context, index) => const EveryOneIsWatching(
  //         movieName: 'name',
  //         movieDiscription: 'discription',
  //         posterPath: 'posterpath'),
  //     itemCount: 10,
  //   );
  // }
  //
  //
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//!comming soon tab view.
class CommingsoonTabview extends StatelessWidget {
  const CommingsoonTabview({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandNewBloc>(context).add(const Getdataincommingsoon());
    });

    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandNewBloc>(context)
            .add(const Getdataincommingsoon());
      },
      child: BlocBuilder<HotandNewBloc, HotandNewState>(
        builder: (context, state) {
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
          } else if (state.commingsoon!.isEmpty) {
            return const Center(
              child: Text("Fetched data is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                final movieElementData = state.commingsoon![index];
                // log(movieElementData.id.toString());

                if (movieElementData.id == null) {
                  return const SizedBox();
                } else {
                  String day = '';
                  String month = '';
                  try {
                    //////////////////////////////
                    //! week day formatting

                    final date =
                        DateTime.tryParse(movieElementData.releaseDate!);
                    final formattedDate =
                        DateFormat.yMMMMd('en_US').format(date!);
                    month = formattedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();

                    ////////////////////format day s

                    day = movieElementData.releaseDate!.split("-")[1];
                  } catch (_) {
                    day = '';
                    month = '';
                  }

                  return ScreenComingSoon(
                      month: month,
                      day: day,
                      id: 23,
                      movieName: movieElementData.originalTitle ?? '',
                      posterPath:
                          "$imageAppendurl${movieElementData.posterPath}",
                      movieDiscription: movieElementData.overview ?? '');
                }
              },
              itemCount: 10,
            );
          }
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// //!everyone watching tab view
class EveryoneiswatchingTabview extends StatelessWidget {
  const EveryoneiswatchingTabview({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandNewBloc>(context)
          .add(const Getdataeveryoneiswatching());
    });

    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandNewBloc>(context)
            .add(const Getdataincommingsoon());
      },
      child: BlocBuilder<HotandNewBloc, HotandNewState>(
        builder: (context, state) {
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
          } else if (state.evryoneisWatching!.isEmpty) {
            return const Center(
              child: Text("Fetched data is empty"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final movieElementData1 = state.evryoneisWatching![index];
                // log(movieElementData.id.toString());

                if (movieElementData1.id == null) {
                  return const SizedBox();
                } else {
                  return EveryOneIsWatching(
                      movieName: movieElementData1.original_name ?? '',
                      posterPath:
                          "$imageAppendurl${movieElementData1.posterPath}",
                      movieDiscription: movieElementData1.overview ?? '');
                }
              },
              itemCount: 10,
            );
          }
        },
      ),
    );
  }
}
