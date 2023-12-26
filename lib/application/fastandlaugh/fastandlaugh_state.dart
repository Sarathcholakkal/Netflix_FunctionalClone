part of 'fastandlaugh_bloc.dart';

@freezed
class FastandlaughState with _$FastandlaughState {
  const factory FastandlaughState(
      {required List<Downloads> videoList,
      required bool isError,
      required bool isloading}) = _Initial;
  factory FastandlaughState.intial() {
    return const FastandlaughState(
        videoList: [], isError: false, isloading: false);
  }
}
