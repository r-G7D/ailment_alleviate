// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required int id,
    @JsonKey(name: 'nama_bahan') required String name,
    @JsonKey(name: 'gambar') required String pic,
    @JsonKey(name: 'keterangan') required String desc,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
