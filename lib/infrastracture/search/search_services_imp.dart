import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/search/model/response_data/response_data.dart';
import 'package:netflix_app/domain/search/search_services.dart';
import 'package:netflix_app/domain/core/api_end_point.dart';

@LazySingleton(as: SearchServices)
class SearchservicesImp implements SearchServices {
  @override
  Future<Either<Mainfauilure, SearchResponseData>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(Apiendpoints.ksearch, queryParameters: {'query': movieQuery});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final serchserviceList = SearchResponseData.fromJson(response.data);
        log(serchserviceList.toString());
        return Right(serchserviceList);
      } else {
        return const Left(Mainfauilure.clientfauilure());
      }
    } catch (e) {
      return const Left(Mainfauilure.serverfauilure());
    }
  }
}
