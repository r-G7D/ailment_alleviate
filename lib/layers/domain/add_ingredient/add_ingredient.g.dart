// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddIngredient _$$_AddIngredientFromJson(Map<String, dynamic> json) =>
    _$_AddIngredient(
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AddIngredientToJson(_$_AddIngredient instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients,
    };
