import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/search/model/response_data/response_data.dart';

abstract class SearchServices {
  Future<Either<Mainfauilure, SearchResponseData>> searchMovies(
      {required String movieQuery});
}
