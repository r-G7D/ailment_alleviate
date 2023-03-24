// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as int,
      name: json['name'] as String?,
      pic: json['image'] as String?,
      desc: json['description'] as String?,
      usage: json['usage_rules'] as String?,
      steps: json['ways_to_use'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.pic,
      'description': instance.desc,
      'usage_rules': instance.usage,
      'ways_to_use': instance.steps,
      'ingredients': instance.ingredients,
    };
