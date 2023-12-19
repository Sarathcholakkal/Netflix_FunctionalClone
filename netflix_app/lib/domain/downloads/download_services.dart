import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/fauilure/mainfauilure.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

abstract class DownloadServices {
  Future<Either<Mainfauilure, List<Downloads>>> getDownloadImages();
}
