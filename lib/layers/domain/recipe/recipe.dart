// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:ailment_alleviate/layers/domain/ingredient/ingredient.dart';
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
    @JsonKey(name: 'bahan') required List<Ingredient> ingredients,
    // required dynamic symptoms,
    @JsonKey(name: 'cara_pembuatan') required String steps,
    @JsonKey(name: 'aturan_pemakaian') required String usage,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
