import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fastandlaugh/fastandlaugh_bloc.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/presentation/fast_laugh/video_list_item.dart';

class VideoListItemInherited extends InheritedWidget {
  final Widget widgetchild;
  final Downloads movieData;
  const VideoListItemInherited({
    required super.key,
    required this.movieData,
    required this.widgetchild,
  }) : super(
          child: widgetchild,
        );

  @override
  bool updateShouldNotify(covariant VideoListItemInherited oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoListItemInherited>();
  }
}

class ScreenFastLaugh extends StatelessWidget {
  ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) { BlocProvider.of(context) .add(FastandlaughEvent.initialze()); });
    BlocProvider.of<FastandlaughBloc>(context)
        .add(const FastandlaughEvent.initialze());
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastandlaughBloc, FastandlaughState>(
            builder: (context, state) {
          if (state.isloading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text(' ERROR IN LOADING'),
            );
          } else if (state.videoList == []) {
            return const Center(
              child: Text(' NO VIDEO AVIALBLE'),
            );
          } else {}
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(state.videoList.length, (index) {
              final moviedata = state.videoList[index];

              return VideoListItemInherited(
                  key: Key(index.toString()),
                  movieData: moviedata,
                  widgetchild: VideoListItem(index: index));
            }),
          );
        }),
      ),
    );
  }
}
