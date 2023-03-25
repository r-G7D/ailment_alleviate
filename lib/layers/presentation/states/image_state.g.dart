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

String _$InputImgRecipeHash() => r'84dc27e880d1cdca81043dd954c7307ffde5b99e';

/// See also [InputImgRecipe].
final inputImgRecipeProvider =
    AutoDisposeNotifierProvider<InputImgRecipe, XFile?>(
  InputImgRecipe.new,
  name: r'inputImgRecipeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$InputImgRecipeHash,
);
typedef InputImgRecipeRef = AutoDisposeNotifierProviderRef<XFile?>;

abstract class _$InputImgRecipe extends AutoDisposeNotifier<XFile?> {
  @override
  XFile? build();
}

String _$InputImgCreateIngHash() => r'315e616099cd95bdff29e8027d6213c6eab5dfd4';

/// See also [InputImgCreateIng].
final inputImgCreateIngProvider =
    AutoDisposeNotifierProvider<InputImgCreateIng, XFile?>(
  InputImgCreateIng.new,
  name: r'inputImgCreateIngProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$InputImgCreateIngHash,
);
typedef InputImgCreateIngRef = AutoDisposeNotifierProviderRef<XFile?>;

abstract class _$InputImgCreateIng extends AutoDisposeNotifier<XFile?> {
  @override
  XFile? build();
}
