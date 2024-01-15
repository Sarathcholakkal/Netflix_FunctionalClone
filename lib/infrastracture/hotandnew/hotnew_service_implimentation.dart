import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_point.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';

import 'package:netflix_app/domain/hotandNew/hot_new_services.dart';
import 'package:netflix_app/domain/hotandNew/newmodel/hotnewreponse_new/hotnewreponse_new.dart';

@LazySingleton(as: HotNewService)
class HotNewServiceImplimentaion extends HotNewService {
  @override
  Future<Either<Mainfauilure, HotNewResponse>> getHotNewMovieResponse() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        Apiendpoints.khotandsearchMovies,
      );
      // log(response.data.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final serchserviceList = HotNewResponse.fromJson(response.data);
        // log(serchserviceList.toString());

        return Right(serchserviceList);
      } else {
        return const Left(Mainfauilure.clientfauilure());
      }
    } catch (e) {
      log("Server failure: ${e.toString()}");
      return const Left(Mainfauilure.serverfauilure());
    }
  }

  @override
  Future<Either<Mainfauilure, HotNewResponse>> getHotNewTVResponse() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        Apiendpoints.khotandsearchTV,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final serchserviceList = HotNewResponse.fromJson(response.data);

        return Right(serchserviceList);
      } else {
        return const Left(Mainfauilure.clientfauilure());
      }
    } catch (e) {
      return const Left(Mainfauilure.serverfauilure());
    }
  }
}
