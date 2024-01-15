part of 'hotand_new_bloc.dart';

@freezed
class HotandNewState with _$HotandNewState {
  const factory HotandNewState(
      {List<HotNewsingleResponse>? evryoneisWatching,
      required List<HotNewsingleResponse>? commingsoon,
      required bool isError,
      required bool isloading}) = _Initial;
  //
  factory HotandNewState.initial() {
    return const HotandNewState(
        evryoneisWatching: [],
        commingsoon: [],
        isError: false,
        isloading: false);
  }
}
