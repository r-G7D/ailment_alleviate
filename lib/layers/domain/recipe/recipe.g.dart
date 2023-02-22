// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      symptoms: json['symptoms'],
      ingredients: json['ingredients'],
      steps: json['steps'],
      usage: json['usage'],
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'symptoms': instance.symptoms,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'usage': instance.usage,
    };
