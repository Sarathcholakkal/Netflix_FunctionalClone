part of 'download_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState(
      {required bool isloading,
      required List<Downloads> downloads,
      required Option<Either<Mainfauilure, List<Downloads>>>
          downloadsucessOrfailure}) = _DownloadsState;
  factory DownloadsState.initial() {
    return const DownloadsState(
        isloading: false, downloads: [], downloadsucessOrfailure: None());
  }
}
