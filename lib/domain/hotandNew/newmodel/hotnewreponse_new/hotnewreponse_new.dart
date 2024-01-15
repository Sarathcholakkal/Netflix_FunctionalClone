import 'package:json_annotation/json_annotation.dart';

part 'hotnewreponse_new.g.dart';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@JsonSerializable()
class HotNewResponse {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<HotNewsingleResponse>? results;

  HotNewResponse({this.page, this.results = const []});

  factory HotNewResponse.fromJson(Map<String, dynamic> json) {
    return _$HotNewResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotNewResponseToJson(this);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@JsonSerializable()
class HotNewsingleResponse {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;
  ///////////////////////////
  //! original name is instead of original tittle in page everyone is watching.
  @JsonKey(name: 'original_name')
  String? original_name;
  //////////////////////////////
  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;

  HotNewsingleResponse({
    this.backdropPath,
    this.id,
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
