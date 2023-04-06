import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/auth/auth_repository.dart';
import '../../data/dashboard/dashboard_repo.dart';
import '../../domain/ingredient/ingredient.dart';
import '../../domain/recipe/recipe.dart';
import '../pages/auth/state/auth_state.dart';
import '../states/basic_state.dart';

part 'basic_controller.g.dart';

@riverpod
class BasicController extends _$BasicController {
  @override
  FutureOr<void> build() {}

  checkToken() async {
    var storage = const FlutterSecureStorage();
    // await storage.delete(key: 'token');
    var token = await storage.read(key: 'token');
    if (token == '' || token == null) {
      log('token null');
    } else {
      ref.read(tokenProvider.notifier).state = token.toString();
      log(ref.watch(tokenProvider).toString());
    }
  }
}

final tokenProvider = StateProvider<String>((ref) {
  return '';
});

final recipePage = Provider<PageController>((ref) {
  return PageController();
});

final queryC = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final sortProvider = StateProvider<String>((ref) {
  return 'name';
});

final searchProvider = FutureProvider<List<Recipe>>((ref) async {
  var filter = ref.watch(filterProvider);
  var query = ref.watch(queryProvider);
  var repo = ref.watch(dashboardRepositoryProvider);
  var sort = ref.watch(sortProvider);
  return repo.fetchRecipes(query, filter, sort);
});

final ingredientProvider = FutureProvider<List<Ingredient>>((ref) async {
  var repo = ref.watch(dashboardRepositoryProvider);
  return repo.fetchIngredients();
});

final recipeProvider = FutureProvider<Recipe>((ref) async {
  var repo = ref.watch(dashboardRepositoryProvider);
  var id = ref.watch(idProvider);
  log(id.toString());
  return repo.fetchRecipe(id);
});

final loginProvider = FutureProvider<dynamic>((ref) async {
  var email = ref.watch(emailProvider);
  var password = ref.watch(passwordProvider);
  return ref.watch(authRepositoryProvider).login(email, password);
});

final registerProvider = FutureProvider<dynamic>((ref) async {
  var name = ref.watch(nameProvider);
  var email = ref.watch(emailProvider);
  var password = ref.watch(passwordProvider);
  var confirmPassword = ref.watch(confirmpasswordProvider);
  var address = ref.watch(addressProvider);
  var phone = ref.watch(phoneProvider);
  var pendukungFile = ref.watch(pendukungFileProvider);
  var sertifikatFile = ref.watch(sertifikatFileProvider);

  return ref.watch(authRepositoryProvider).register(
        name,
        email,
        password,
        confirmPassword,
        address,
        phone,
        pendukungFile,
        sertifikatFile,
      );
});
