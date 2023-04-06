// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddIngredient _$AddIngredientFromJson(Map<String, dynamic> json) {
  return _AddIngredient.fromJson(json);
}

/// @nodoc
mixin _$AddIngredient {
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddIngredientCopyWith<AddIngredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddIngredientCopyWith<$Res> {
  factory $AddIngredientCopyWith(
          AddIngredient value, $Res Function(AddIngredient) then) =
      _$AddIngredientCopyWithImpl<$Res, AddIngredient>;
  @useResult
  $Res call({List<Ingredient> ingredients});
}

/// @nodoc
class _$AddIngredientCopyWithImpl<$Res, $Val extends AddIngredient>
    implements $AddIngredientCopyWith<$Res> {
  _$AddIngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddIngredientCopyWith<$Res>
    implements $AddIngredientCopyWith<$Res> {
  factory _$$_AddIngredientCopyWith(
          _$_AddIngredient value, $Res Function(_$_AddIngredient) then) =
      __$$_AddIngredientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Ingredient> ingredients});
}

/// @nodoc
class __$$_AddIngredientCopyWithImpl<$Res>
    extends _$AddIngredientCopyWithImpl<$Res, _$_AddIngredient>
    implements _$$_AddIngredientCopyWith<$Res> {
  __$$_AddIngredientCopyWithImpl(
      _$_AddIngredient _value, $Res Function(_$_AddIngredient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_$_AddIngredient(
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddIngredient implements _AddIngredient {
  _$_AddIngredient({required final List<Ingredient> ingredients})
      : _ingredients = ingredients;

  factory _$_AddIngredient.fromJson(Map<String, dynamic> json) =>
      _$$_AddIngredientFromJson(json);

  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'AddIngredient(ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddIngredient &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddIngredientCopyWith<_$_AddIngredient> get copyWith =>
      __$$_AddIngredientCopyWithImpl<_$_AddIngredient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddIngredientToJson(
      this,
    );
  }
}

abstract class _AddIngredient implements AddIngredient {
  factory _AddIngredient({required final List<Ingredient> ingredients}) =
      _$_AddIngredient;

  factory _AddIngredient.fromJson(Map<String, dynamic> json) =
      _$_AddIngredient.fromJson;

  @override
  List<Ingredient> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_AddIngredientCopyWith<_$_AddIngredient> get copyWith =>
      throw _privateConstructorUsedError;
}
