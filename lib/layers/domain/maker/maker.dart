import 'package:freezed_annotation/freezed_annotation.dart';

import '../recipe/recipe.dart';

part 'maker.freezed.dart';
part 'maker.g.dart';

@freezed
class Maker with _$Maker {
  factory Maker({
    @JsonKey(name: 'status') required String accountStatus,
    Map<String, String>? profile,
    List<Recipe>? pending,
    List<Recipe>? accepted,
  }) = _Maker;

  factory Maker.fromJson(Map<String, dynamic> json) => _$MakerFromJson(json);
}
