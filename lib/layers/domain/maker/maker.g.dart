// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Maker _$$_MakerFromJson(Map<String, dynamic> json) => _$_Maker(
      accountStatus: json['status'] as String,
      profile: (json['profile'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      accepted: (json['accepted_medication'] as List<dynamic>?)
          ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      pending: (json['waiting_medication'] as List<dynamic>?)
          ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      declined: (json['canceled_medication'] as List<dynamic>?)
          ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MakerToJson(_$_Maker instance) => <String, dynamic>{
      'status': instance.accountStatus,
      'profile': instance.profile,
      'accepted_medication': instance.accepted,
      'waiting_medication': instance.pending,
      'canceled_medication': instance.declined,
    };
