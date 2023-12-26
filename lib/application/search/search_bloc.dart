import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/downloads/download_services.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/domain/search/model/response_data/response_data.dart';
import 'package:netflix_app/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final DownloadServices _downloadServices;
  final SearchServices _searchServices;
  SearchBloc(this._downloadServices, this._searchServices)
      : super(SearchState.initial()) {
    //initial event
    on<Initialize>((event, emit) async {
      //avoid repeat loading
      if (state.idlelist.isNotEmpty) {
        SearchState(
            isloading: false,
            iserror: false,
            idlelist: state.idlelist,
            searchlist: []);
        return;
      }

      //loading state
      emit(const SearchState(
          isloading: true, iserror: false, idlelist: [], searchlist: []));
      // api call and result state
      final templistidle = await _downloadServices.getDownloadsimagefn();
      // log(templistidle.toString());
      emit(templistidle.fold((failure) {
        return const SearchState(
            isloading: false, iserror: true, idlelist: [], searchlist: []);
      }, (success) {
        return SearchState(
            isloading: false,
            iserror: false,
            idlelist: success,
            searchlist: []);
      }));
    });
    //
    //
    //searchmovie event
    on<_SearchMovies>((event, emit) async {
      // avoiding repeat loading.
      //loading
      emit(const SearchState(
          isloading: true, iserror: false, idlelist: [], searchlist: []));

      // apicall
      final templistsearchmovie =
          await _searchServices.searchMovies(movieQuery: event.movieQuery);
      log(templistsearchmovie.toString());
      // updating  api state
      emit(templistsearchmovie.fold(
        //
        (Mainfauilure l) {
          return const SearchState(
              isloading: false, iserror: true, idlelist: [], searchlist: []);
        },
        //
        (sucess) {
          log(sucess.results.toString());
          return SearchState(
              isloading: false,
              iserror: false,
              idlelist: [],
              searchlist: sucess.results);
        },
      ));

      // emiting
      // emit(_state);
    });
  }
}
