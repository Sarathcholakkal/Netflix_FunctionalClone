import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/hotandNew/model/hot_new_response.dart';

abstract class HotNewService {
  Future<Either<Mainfauilure, HotNewResponse>> getHotNewMovieResponse();
  Future<Either<Mainfauilure, HotNewResponse>> getHotNewTVResponse();
}
