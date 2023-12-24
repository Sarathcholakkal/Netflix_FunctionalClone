import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
    on<_Initialize>((event, emit) {
      //loading
      emit(const SearchState(
          isloading: true, iserror: false, idlelist: [], searchlist: []));
      // api call
      _downloadServices.getDownloadsimagefn();
    });
    //
    //
    //searchmovie event
    on<_SearchMovies>((event, emit) {
      //loading

      // apicall
      _searchServices.searchMovies(movieQuery: 'helo');
    });
  }
}
