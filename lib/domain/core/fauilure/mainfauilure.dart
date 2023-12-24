import "package:freezed_annotation/freezed_annotation.dart";
part 'mainfauilure.freezed.dart';

@freezed
class Mainfauilure with _$Mainfauilure {
  const factory Mainfauilure.clientfauilure() = _Clientfauilure;
  const factory Mainfauilure.serverfauilure() = _Serverfauilure;
}
