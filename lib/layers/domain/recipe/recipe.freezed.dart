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
  @JsonKey(name: 'nama_obat')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'keterangan')
  String? get desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'gambar')
  String? get pic => throw _privateConstructorUsedError;
  @JsonKey(name: 'bahan')
  List<Ingredient> get ingredients =>
      throw _privateConstructorUsedError; // required dynamic symptoms,
  @JsonKey(name: 'cara_pembuatan')
  String get steps => throw _privateConstructorUsedError;
  @JsonKey(name: 'aturan_pemakaian')
  String get usage => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'nama_obat') String? name,
      @JsonKey(name: 'keterangan') String? desc,
      @JsonKey(name: 'gambar') String? pic,
      @JsonKey(name: 'bahan') List<Ingredient> ingredients,
      @JsonKey(name: 'cara_pembuatan') String steps,
      @JsonKey(name: 'aturan_pemakaian') String usage});
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
    Object? desc = freezed,
    Object? pic = freezed,
    Object? ingredients = null,
    Object? steps = null,
    Object? usage = null,
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
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: 'nama_obat') String? name,
      @JsonKey(name: 'keterangan') String? desc,
      @JsonKey(name: 'gambar') String? pic,
      @JsonKey(name: 'bahan') List<Ingredient> ingredients,
      @JsonKey(name: 'cara_pembuatan') String steps,
      @JsonKey(name: 'aturan_pemakaian') String usage});
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
    Object? desc = freezed,
    Object? pic = freezed,
    Object? ingredients = null,
    Object? steps = null,
    Object? usage = null,
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
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  const _$_Recipe(
      {required this.id,
      @JsonKey(name: 'nama_obat') required this.name,
      @JsonKey(name: 'keterangan') required this.desc,
      @JsonKey(name: 'gambar') required this.pic,
      @JsonKey(name: 'bahan') required final List<Ingredient> ingredients,
      @JsonKey(name: 'cara_pembuatan') required this.steps,
      @JsonKey(name: 'aturan_pemakaian') required this.usage})
      : _ingredients = ingredients;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nama_obat')
  final String? name;
  @override
  @JsonKey(name: 'keterangan')
  final String? desc;
  @override
  @JsonKey(name: 'gambar')
  final String? pic;
  final List<Ingredient> _ingredients;
  @override
  @JsonKey(name: 'bahan')
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

// required dynamic symptoms,
  @override
  @JsonKey(name: 'cara_pembuatan')
  final String steps;
  @override
  @JsonKey(name: 'aturan_pemakaian')
  final String usage;

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, desc: $desc, pic: $pic, ingredients: $ingredients, steps: $steps, usage: $usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, desc, pic,
      const DeepCollectionEquality().hash(_ingredients), steps, usage);

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
          @JsonKey(name: 'nama_obat') required final String? name,
          @JsonKey(name: 'keterangan') required final String? desc,
          @JsonKey(name: 'gambar') required final String? pic,
          @JsonKey(name: 'bahan') required final List<Ingredient> ingredients,
          @JsonKey(name: 'cara_pembuatan') required final String steps,
          @JsonKey(name: 'aturan_pemakaian') required final String usage}) =
      _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nama_obat')
  String? get name;
  @override
  @JsonKey(name: 'keterangan')
  String? get desc;
  @override
  @JsonKey(name: 'gambar')
  String? get pic;
  @override
  @JsonKey(name: 'bahan')
  List<Ingredient> get ingredients;
  @override // required dynamic symptoms,
  @JsonKey(name: 'cara_pembuatan')
  String get steps;
  @override
  @JsonKey(name: 'aturan_pemakaian')
  String get usage;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}
