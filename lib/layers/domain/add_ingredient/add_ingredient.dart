import 'package:ailment_alleviate/layers/domain/ingredient/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_ingredient.freezed.dart';
part 'add_ingredient.g.dart';

@freezed
class AddIngredient with _$AddIngredient {
  factory AddIngredient({
    required List<Ingredient> ingredients,
  }) = _AddIngredient;

  factory AddIngredient.fromJson(Map<String, dynamic> json) =>
      _$AddIngredientFromJson(json);
}
