import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/hotandNew/hot_new_services.dart';
import 'package:netflix_app/domain/hotandNew/model/hot_new_response.dart';

part 'hotand_new_event.dart';
part 'hotand_new_state.dart';
part 'hotand_new_bloc.freezed.dart';

@injectable
class HotandNewBloc extends Bloc<HotandNewEvent, HotandNewState> {
  final HotNewService _hotNewService;
  HotandNewBloc(this._hotNewService) : super(HotandNewState.initial()) {
    //get movie data
    on<Getdataincommingsoon>(
      (event, emit) async {
// commingsoon loading stage
        emit(const HotandNewState(
            evryoneisWatching: [],
            commingsoon: [],
            isError: false,
            isloading: true));
        // comming soon data recieved stage.
        final result = await _hotNewService.getHotNewMovieResponse();
        log(result.toString());
        emit(result.fold((failure) {
          return const HotandNewState(
              evryoneisWatching: [],
              commingsoon: [],
              isError: true,
              isloading: false);
        }, (HotNewResponse res) {
          // log(res.hotnewResponse.toString());
          return HotandNewState(
              evryoneisWatching: state.evryoneisWatching,
              commingsoon: res.hotnewResponse!,
              isError: false,
              isloading: false);
        }));
      },
    );

    //get tv data
    on<Getdataeveryoneiswatching>((event, emit) async {
      // loading stage of everyone is watching
      emit(const HotandNewState(
          evryoneisWatching: [],
          commingsoon: [],
          isError: false,
          isloading: true));
      // service call of everyone is watching
      final resultc = await _hotNewService.getHotNewTVResponse();
      //  data recieved in everyone is watching screen
      emit(resultc.fold((Mainfauilure fauilure) {
        return const HotandNewState(
            evryoneisWatching: [],
            commingsoon: [],
            isError: true,
            isloading: false);
      },
          //
          (HotNewResponse success) {
        // log(success.toString());
        return HotandNewState(
            evryoneisWatching: success.hotnewResponse!,
            commingsoon: state.commingsoon,
            isError: false,
            isloading: false);
      }));
    });
  }
}
