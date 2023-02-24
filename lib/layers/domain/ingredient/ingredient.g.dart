// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      id: json['id'] as int,
      name: json['nama_bahan'] as String,
      pic: json['gambar'] as String,
      desc: json['keterangan'] as String,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_bahan': instance.name,
      'gambar': instance.pic,
      'keterangan': instance.desc,
    };
