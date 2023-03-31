// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get pic => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get desc =>
      throw _privateConstructorUsedError; // required dynamic symptoms,
  @JsonKey(name: 'usage_rules')
  String? get usage => throw _privateConstructorUsedError;
  @JsonKey(name: 'ways_to_use')
  String? get steps => throw _privateConstructorUsedError;
  String? get peracik => throw _privateConstructorUsedError;
  List<Ingredient>? get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'image') String? pic,
      @JsonKey(name: 'description') String? desc,
      @JsonKey(name: 'usage_rules') String? usage,
      @JsonKey(name: 'ways_to_use') String? steps,
      String? peracik,
      List<Ingredient>? ingredients});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? pic = freezed,
    Object? desc = freezed,
    Object? usage = freezed,
    Object? steps = freezed,
    Object? peracik = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String?,
      peracik: freezed == peracik
          ? _value.peracik
          : peracik // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) =
      __$$_RecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'image') String? pic,
      @JsonKey(name: 'description') String? desc,
      @JsonKey(name: 'usage_rules') String? usage,
      @JsonKey(name: 'ways_to_use') String? steps,
      String? peracik,
      List<Ingredient>? ingredients});
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$_Recipe>
    implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? pic = freezed,
    Object? desc = freezed,
    Object? usage = freezed,
    Object? steps = freezed,
    Object? peracik = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_$_Recipe(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String?,
      peracik: freezed == peracik
          ? _value.peracik
          : peracik // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  const _$_Recipe(
      {required this.id,
      required this.name,
      @JsonKey(name: 'image') required this.pic,
      @JsonKey(name: 'description') required this.desc,
      @JsonKey(name: 'usage_rules') required this.usage,
      @JsonKey(name: 'ways_to_use') required this.steps,
      this.peracik,
      required final List<Ingredient>? ingredients})
      : _ingredients = ingredients;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'image')
  final String? pic;
  @override
  @JsonKey(name: 'description')
  final String? desc;
// required dynamic symptoms,
  @override
  @JsonKey(name: 'usage_rules')
  final String? usage;
  @override
  @JsonKey(name: 'ways_to_use')
  final String? steps;
  @override
  final String? peracik;
  final List<Ingredient>? _ingredients;
  @override
  List<Ingredient>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, pic: $pic, desc: $desc, usage: $usage, steps: $steps, peracik: $peracik, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.peracik, peracik) || other.peracik == peracik) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, pic, desc, usage,
      steps, peracik, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final int id,
      required final String? name,
      @JsonKey(name: 'image') required final String? pic,
      @JsonKey(name: 'description') required final String? desc,
      @JsonKey(name: 'usage_rules') required final String? usage,
      @JsonKey(name: 'ways_to_use') required final String? steps,
      final String? peracik,
      required final List<Ingredient>? ingredients}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'image')
  String? get pic;
  @override
  @JsonKey(name: 'description')
  String? get desc;
  @override // required dynamic symptoms,
  @JsonKey(name: 'usage_rules')
  String? get usage;
  @override
  @JsonKey(name: 'ways_to_use')
  String? get steps;
  @override
  String? get peracik;
  @override
  List<Ingredient>? get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}
