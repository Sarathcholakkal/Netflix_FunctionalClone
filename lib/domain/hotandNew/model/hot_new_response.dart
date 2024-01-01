import 'package:json_annotation/json_annotation.dart';

part 'hot_new_response.g.dart';

@JsonSerializable()
class HotNewResponse {
  int? page;
  List<HotNewsingleResponse>? hotnewResponse;

  HotNewResponse({this.page, this.hotnewResponse});

  factory HotNewResponse.fromJson(Map<String, dynamic> json) {
    return _$HotNewResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotNewResponseToJson(this);
}

@JsonSerializable()
class HotNewsingleResponse {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;

  HotNewsingleResponse({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory HotNewsingleResponse.fromJson(Map<String, dynamic> json) {
    return _$HotNewsingleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotNewsingleResponseToJson(this);
}
