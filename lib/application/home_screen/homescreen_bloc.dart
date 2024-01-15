import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/hotandNew/hot_new_services.dart';
import 'package:netflix_app/domain/hotandNew/newmodel/hotnewreponse_new/hotnewreponse_new.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';
part 'homescreen_bloc.freezed.dart';

@injectable
class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HotNewService homeservice;
  HomescreenBloc(this.homeservice) : super(HomescreenState.initial()) {
    //?on event home screen
    on<HomescreenEvent>((event, emit) async {
      log("on home screen function is called");
      //? loading UI
      emit(HomescreenState(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          pastyearmoveilist: [],
          trendingnowlist: [],
          toptentvshowlist: [],
          tensdramalist: [],
          southindanmovieslist: [],
          iserror: false,
          isloading: true));

      //? get data
      final movieresult = await homeservice.getHotNewMovieResponse();
      final tvresult = await homeservice.getHotNewTVResponse();
      ///////////////////////////////////////////////////////////////////////////////////////////////////
      //?  Tranform movei Data
      final foldedmovieresult = await movieresult.fold((Mainfauilure fauilure) {
        return HomescreenState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmoveilist: [],
            trendingnowlist: [],
            toptentvshowlist: [],
            tensdramalist: [],
            southindanmovieslist: [],
            iserror: true,
            isloading: false);
      }, (HotNewResponse res) {
        final pastyear = res.results;
        final trending = res.results;

        final drama = res.results;
        final southindia = res.results;
        ///////////////////////
        pastyear!.shuffle();
        trending!.shuffle();

        drama!.shuffle();
        southindia!.shuffle();
        //////////
        log("calling of sucess movielist");

        return HomescreenState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmoveilist: pastyear,
            trendingnowlist: trending,
            toptentvshowlist: [],
            tensdramalist: drama,
            southindanmovieslist: southindia,
            iserror: false,
            isloading: false);
      });
      emit(foldedmovieresult);
      ////////////////////////////////////////////////////////////////////////////////////
      //? tranform Tv data
      final foldedtvresutl = await tvresult.fold((Mainfauilure fauilure) {
        log("fauilere section executed");
        return HomescreenState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmoveilist: [],
            trendingnowlist: [],
            toptentvshowlist: [],
            tensdramalist: [],
            southindanmovieslist: [],
            iserror: true,
            isloading: false);
      }, (HotNewResponse sucess) {
        final toptentv = sucess.results;

        log("calling of tv suceess");
        return HomescreenState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearmoveilist: state.pastyearmoveilist,
            trendingnowlist: state.trendingnowlist,
            toptentvshowlist: toptentv!,
            tensdramalist: state.tensdramalist,
            southindanmovieslist: state.southindanmovieslist,
            iserror: false,
            isloading: false);
      });
      /////////////////////////////////////////////////////////////////////////////////////////////////////////

      //? emit data to UI

      emit(foldedtvresutl);
    });
  }
}
