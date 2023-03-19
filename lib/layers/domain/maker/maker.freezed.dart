// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Maker _$MakerFromJson(Map<String, dynamic> json) {
  return _Maker.fromJson(json);
}

/// @nodoc
mixin _$Maker {
  @JsonKey(name: 'status')
  String get accountStatus => throw _privateConstructorUsedError;
  Map<String, String>? get profile => throw _privateConstructorUsedError;
  List<Recipe>? get pending => throw _privateConstructorUsedError;
  List<Recipe>? get accepted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MakerCopyWith<Maker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakerCopyWith<$Res> {
  factory $MakerCopyWith(Maker value, $Res Function(Maker) then) =
      _$MakerCopyWithImpl<$Res, Maker>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String accountStatus,
      Map<String, String>? profile,
      List<Recipe>? pending,
      List<Recipe>? accepted});
}

/// @nodoc
class _$MakerCopyWithImpl<$Res, $Val extends Maker>
    implements $MakerCopyWith<$Res> {
  _$MakerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountStatus = null,
    Object? profile = freezed,
    Object? pending = freezed,
    Object? accepted = freezed,
  }) {
    return _then(_value.copyWith(
      accountStatus: null == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      pending: freezed == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
      accepted: freezed == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MakerCopyWith<$Res> implements $MakerCopyWith<$Res> {
  factory _$$_MakerCopyWith(_$_Maker value, $Res Function(_$_Maker) then) =
      __$$_MakerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String accountStatus,
      Map<String, String>? profile,
      List<Recipe>? pending,
      List<Recipe>? accepted});
}

/// @nodoc
class __$$_MakerCopyWithImpl<$Res> extends _$MakerCopyWithImpl<$Res, _$_Maker>
    implements _$$_MakerCopyWith<$Res> {
  __$$_MakerCopyWithImpl(_$_Maker _value, $Res Function(_$_Maker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountStatus = null,
    Object? profile = freezed,
    Object? pending = freezed,
    Object? accepted = freezed,
  }) {
    return _then(_$_Maker(
      accountStatus: null == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      pending: freezed == pending
          ? _value._pending
          : pending // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
      accepted: freezed == accepted
          ? _value._accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as List<Recipe>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Maker implements _Maker {
  _$_Maker(
      {@JsonKey(name: 'status') required this.accountStatus,
      final Map<String, String>? profile,
      final List<Recipe>? pending,
      final List<Recipe>? accepted})
      : _profile = profile,
        _pending = pending,
        _accepted = accepted;

  factory _$_Maker.fromJson(Map<String, dynamic> json) =>
      _$$_MakerFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String accountStatus;
  final Map<String, String>? _profile;
  @override
  Map<String, String>? get profile {
    final value = _profile;
    if (value == null) return null;
    if (_profile is EqualUnmodifiableMapView) return _profile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Recipe>? _pending;
  @override
  List<Recipe>? get pending {
    final value = _pending;
    if (value == null) return null;
    if (_pending is EqualUnmodifiableListView) return _pending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Recipe>? _accepted;
  @override
  List<Recipe>? get accepted {
    final value = _accepted;
    if (value == null) return null;
    if (_accepted is EqualUnmodifiableListView) return _accepted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Maker(accountStatus: $accountStatus, profile: $profile, pending: $pending, accepted: $accepted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Maker &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            const DeepCollectionEquality().equals(other._profile, _profile) &&
            const DeepCollectionEquality().equals(other._pending, _pending) &&
            const DeepCollectionEquality().equals(other._accepted, _accepted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountStatus,
      const DeepCollectionEquality().hash(_profile),
      const DeepCollectionEquality().hash(_pending),
      const DeepCollectionEquality().hash(_accepted));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MakerCopyWith<_$_Maker> get copyWith =>
      __$$_MakerCopyWithImpl<_$_Maker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MakerToJson(
      this,
    );
  }
}

abstract class _Maker implements Maker {
  factory _Maker(
      {@JsonKey(name: 'status') required final String accountStatus,
      final Map<String, String>? profile,
      final List<Recipe>? pending,
      final List<Recipe>? accepted}) = _$_Maker;

  factory _Maker.fromJson(Map<String, dynamic> json) = _$_Maker.fromJson;

  @override
  @JsonKey(name: 'status')
  String get accountStatus;
  @override
  Map<String, String>? get profile;
  @override
  List<Recipe>? get pending;
  @override
  List<Recipe>? get accepted;
  @override
  @JsonKey(ignore: true)
  _$$_MakerCopyWith<_$_Maker> get copyWith =>
      throw _privateConstructorUsedError;
}
