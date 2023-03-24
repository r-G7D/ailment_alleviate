import 'package:freezed_annotation/freezed_annotation.dart';

import '../recipe/recipe.dart';

part 'maker.freezed.dart';
part 'maker.g.dart';

@freezed
class Maker with _$Maker {
  factory Maker({
    @JsonKey(name: 'status') required String accountStatus,
    Map<String, String>? profile,
    @JsonKey(name: 'accepted_medication') List<Recipe>? accepted,
    @JsonKey(name: 'waiting_medication') List<Recipe>? pending,
    @JsonKey(name: 'canceled_medication') List<Recipe>? declined,
  }) = _Maker;

  factory Maker.fromJson(Map<String, dynamic> json) => _$MakerFromJson(json);
}
