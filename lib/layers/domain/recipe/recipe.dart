import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String? id,
    required String? name,
    required String? imageUrl,
    required String? description,
    required dynamic symptoms,
    required dynamic ingredients,
    required dynamic steps,
    required dynamic usage,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
