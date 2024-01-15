// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotnewreponse_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotNewResponse _$HotNewResponseFromJson(Map<String, dynamic> json) =>
    HotNewResponse(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  HotNewsingleResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HotNewResponseToJson(HotNewResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

HotNewsingleResponse _$HotNewsingleResponseFromJson(
        Map<String, dynamic> json) =>
    HotNewsingleResponse(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
    )..original_name = json['original_name'] as String?;

Map<String, dynamic> _$HotNewsingleResponseToJson(
        HotNewsingleResponse instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_name': instance.original_name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };
