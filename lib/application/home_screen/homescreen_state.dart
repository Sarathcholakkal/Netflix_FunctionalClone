part of 'homescreen_bloc.dart';

@freezed
class HomescreenState with _$HomescreenState {
  const factory HomescreenState(
      {required String id,
      required List<HotNewsingleResponse> pastyearmoveilist,
      required List<HotNewsingleResponse> trendingnowlist,
      required List<HotNewsingleResponse> toptentvshowlist,
      required List<HotNewsingleResponse> tensdramalist,
      required List<HotNewsingleResponse> southindanmovieslist,
      required bool iserror,
      required bool isloading}) = _Initial;
  factory HomescreenState.initial() {
    return const HomescreenState(
      id: "0",
      pastyearmoveilist: [],
      trendingnowlist: [],
      toptentvshowlist: [],
      tensdramalist: [],
      southindanmovieslist: [],
      iserror: false,
      isloading: false,
    );
  }
}
