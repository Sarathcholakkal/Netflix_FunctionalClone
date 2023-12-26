import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class SearchResponseData {
  @JsonKey(name: 'results')
  List<SearchResult> results;

  SearchResponseData({this.results = const []});

  factory SearchResponseData.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseDataToJson(this);
}

//
//

@JsonSerializable()
class SearchResult {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  SearchResult({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
