import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/download_services.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'fastandlaugh_event.dart';
part 'fastandlaugh_state.dart';
part 'fastandlaugh_bloc.freezed.dart';

@injectable
class FastandlaughBloc extends Bloc<FastandlaughEvent, FastandlaughState> {
  DownloadServices _downloadservices;
  FastandlaughBloc(this._downloadservices) : super(FastandlaughState.intial()) {
    on<FastandlaughEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
