// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      id: json['id'] as int,
      name: json['name'] as String,
      pic: json['image'] as String?,
      desc: json['description'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.pic,
      'description': instance.desc,
      'category': instance.category,
    };
