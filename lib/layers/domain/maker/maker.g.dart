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
      pending: (json['pending'] as List<dynamic>?)
          ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      accepted: (json['accepted'] as List<dynamic>?)
          ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MakerToJson(_$_Maker instance) => <String, dynamic>{
      'status': instance.accountStatus,
      'profile': instance.profile,
      'pending': instance.pending,
      'accepted': instance.accepted,
    };
