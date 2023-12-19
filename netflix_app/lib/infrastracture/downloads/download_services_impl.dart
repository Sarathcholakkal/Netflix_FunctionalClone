// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:netflix_app/domain/core/api_end_point.dart';
// import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
// import 'package:netflix_app/domain/downloads/download_services.dart';
// import 'package:netflix_app/domain/downloads/models/downloads.dart';
// import 'package:dio/dio.dart';

// class DownloadServicesImpl implements DownloadServices {
//   @override
//   Future<Either<Mainfauilure, List<Downloads>>> getDownloadImages() async {
//     try {
//       final dio = Dio(BaseOptions());
//       final Response response = await dio.get(Apiendpoints.kdownloads);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final Either<Mainfauilure, List<Downloads>> downloadlistrepo;
//         downloadlistrepo=((response.data['result']).map((e){
//           return downl

//         }));
//       }
//     } catch (e) {}
//   }
// }
























// import 'dart:math';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:netflix_app/domain/core/api_end_point.dart';
// import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
// import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
// import 'package:netflix_app/domain/downloads/models/downloads.dart';

// @LazySingleton(as: IdownloadRepo)
// class IDownloadsRepository implements IdownloadRepo {
//   @override
//   Future<Either<Mainfauilure, List<Downloads>>> getDownloadImages() async {
//     try {
//       final Response response =
//           await Dio(BaseOptions()).get(Apiendpoints.kdownloads);
//       print(response.data.toString());

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final List<Downloads> downloadslist =
//             (response.data['results'] as List).map((e) {
//           return Downloads.fromJson(e);
//         }).toList();
//         print(downloadslist.toString());
//         print(downloadslist);

//         // for (final raw in response.data) {
//         //   downloadslist.add(Downloads.fromJson(raw as Map<String, dynamic>));

//         return Right(downloadslist);
//       } else {
//         return const Left(Mainfauilure.serverfauilure());
//       }
//     } catch (e) {
//       return const Left(Mainfauilure.clientfauilure());
//     }
//   }
// }
