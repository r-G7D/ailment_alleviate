// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as int,
      name: json['nama_obat'] as String?,
      desc: json['keterangan'] as String?,
      pic: json['gambar'] as String?,
      ingredients: json['bahan'],
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'nama_obat': instance.name,
      'keterangan': instance.desc,
      'gambar': instance.pic,
      'bahan': instance.ingredients,
    };
