import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_point.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/downloads/download_services.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: DownloadServices)
class DownloadServicesImpl implements DownloadServices {
  @override
  Future<Either<Mainfauilure, List<Downloads>>> getDownloadsimagefn() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(Apiendpoints.kdownloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.data.toString());

        final List<Downloads> downloadlistrepo =
            ((response.data['results']) as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        // log(downloadlistrepo.toString());

        return Right(downloadlistrepo);
      } else {
        return const Left(Mainfauilure.serverfauilure());
      }
    }
    //
    catch (e) {
      // log(e.toString());

      return const Left(Mainfauilure.clientfauilure());
    }
  }
}

// @LazySingleton(as: DownloadServices)
// class DownloadServicesImpl implements DownloadServices {
//   @override
//   Future<Either<Mainfauilure, List<Downloads>>> getDownloadsimagefn() async {
//     try {
//       final Response response =
//           await Dio(BaseOptions()).get(Apiendpoints.kdownloads);
//       // log(response.statusCode.toString());
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         if (response.data != null && response.data['result'] != null) {
//           final List<Downloads> downloadlistrepo =
//               ((response.data['result']) as List).map((e) {
//             return Downloads.fromJson(e);
//           }).toList();
//           log(downloadlistrepo.toString());

//           return Right(downloadlistrepo);
//         } else {
//           // Handle the case where 'result' is null
//           return const Left(Mainfauilure.clientfauilure());
//         }
//       } else {
//         return const Left(Mainfauilure.serverfauilure());
//       }
//     } catch (e) {
//       log('hai'); // Log the exception
//       return const Left(Mainfauilure.clientfauilure());
//     }
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
//
