// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    @JsonKey(name: 'nama_obat') required String? name,
    @JsonKey(name: 'keterangan') required String? desc,
    @JsonKey(name: 'gambar') required String? pic,
    @JsonKey(name: 'bahan') required dynamic ingredients,
    // required dynamic symptoms,
    // required dynamic ingredients,
    // required dynamic steps,
    // required dynamic usage,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
