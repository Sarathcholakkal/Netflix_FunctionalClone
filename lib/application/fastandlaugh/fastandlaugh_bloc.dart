import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix_app/domain/downloads/download_services.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'fastandlaugh_event.dart';
part 'fastandlaugh_state.dart';
part 'fastandlaugh_bloc.freezed.dart';

final videoDummiUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
];

@injectable
class FastandlaughBloc extends Bloc<FastandlaughEvent, FastandlaughState> {
  DownloadServices _downloadservices;
  FastandlaughBloc(this._downloadservices) : super(FastandlaughState.intial()) {
    on<_Initialize>((event, emit) async {
      // loading time.
      emit(const FastandlaughState(
          videoList: [], isError: false, isloading: false));

      // calling tending movies
      final _result = await _downloadservices.getDownloadsimagefn();
      // final _state = _result.fold(
      //     //
      //     (fail) {
      //   return const FastandlaughState(
      //       videoList: [], isError: true, isloading: false);
      // },
      //     //
      //     (success) {
      //   return FastandlaughState(
      //       videoList: success, isError: false, isloading: false);
      // });
      // emit(_state);

      emit(_result.fold(
          //
          (fail) {
        return const FastandlaughState(
            videoList: [], isError: true, isloading: false);
      },
          //
          (success) {
        return FastandlaughState(
            videoList: success, isError: false, isloading: false);
      }));
    });
  }
}
