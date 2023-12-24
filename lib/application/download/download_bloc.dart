import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/downloads/download_services.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'download_event.dart';
part 'download_state.dart';
part 'download_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final DownloadServices _downloadServices;
  DownloadsBloc(this._downloadServices) : super(DownloadsState.initial()) {
    on<_GetDownloadsimagefn>((event, emit) async {
      // first emit
      emit(const DownloadsState(
          isloading: true, downloads: [], downloadsucessOrfailure: None()));
      // api call
      final Either<Mainfauilure, List<Downloads>> downloadstemp =
          await _downloadServices.getDownloadsimagefn();
      // log(downloadstemp.toString());
      //secondemit
      emit(downloadstemp.fold((failure) {
        //left
        return DownloadsState(
            isloading: false,
            downloads: [],
            downloadsucessOrfailure: Some(Left(failure)));
      },
          //right

          (success) {
        // log(success.toString());
        return DownloadsState(
            isloading: false,
            downloads: success,
            downloadsucessOrfailure: Some(Right(success)));
      }));
    });
  }
}
