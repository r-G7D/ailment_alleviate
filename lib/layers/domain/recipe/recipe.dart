// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:ailment_alleviate/layers/domain/ingredient/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String? name,
    @JsonKey(name: 'image') required String? pic,
    @JsonKey(name: 'description') required String? desc,
    // required dynamic symptoms,
    @JsonKey(name: 'usage_rules') required String? usage,
    @JsonKey(name: 'ways_to_use') required String? steps,
    // @JsonKey(name: 'peracik') required String? peracik,
    required List<Ingredient>? ingredients,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
