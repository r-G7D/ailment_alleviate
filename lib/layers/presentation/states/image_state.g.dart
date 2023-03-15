// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$InputImgRecipeHash() => r'6146d56db1a0e7ebdb96465492051edae2218f46';

/// See also [InputImgRecipe].
final inputImgRecipeProvider =
    AutoDisposeNotifierProvider<InputImgRecipe, File?>(
  InputImgRecipe.new,
  name: r'inputImgRecipeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$InputImgRecipeHash,
);
typedef InputImgRecipeRef = AutoDisposeNotifierProviderRef<File?>;

abstract class _$InputImgRecipe extends AutoDisposeNotifier<File?> {
  @override
  File? build();
}

String _$InputImgCreateIngHash() => r'b228b1084e2049e311fcda3fa413f7ca5e0dcbb6';

/// See also [InputImgCreateIng].
final inputImgCreateIngProvider =
    AutoDisposeNotifierProvider<InputImgCreateIng, File?>(
  InputImgCreateIng.new,
  name: r'inputImgCreateIngProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$InputImgCreateIngHash,
);
typedef InputImgCreateIngRef = AutoDisposeNotifierProviderRef<File?>;

abstract class _$InputImgCreateIng extends AutoDisposeNotifier<File?> {
  @override
  File? build();
}
