part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {required bool isloading,
      required bool iserror,
      required List<Downloads> idlelist,
      required List<SearchResponseData> searchlist}) = _SearchState;
  //
  //
  factory SearchState.initial() {
    return const SearchState(
        isloading: false, iserror: false, idlelist: [], searchlist: []);
  }
}
