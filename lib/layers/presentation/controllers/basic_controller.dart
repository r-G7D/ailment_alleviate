import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dashboard/dashboard_repo.dart';
import '../../domain/ingredient/ingredient.dart';
import '../../domain/recipe/recipe.dart';
import '../states/basic_state.dart';

final recipePage = Provider<PageController>((ref) {
  return PageController();
});

final queryC = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final searchProvider = FutureProvider<List<Recipe>>((ref) async {
  var filter = ref.watch(filterProvider);
  var query = ref.watch(queryProvider);
  var repo = ref.watch(dashboardRepositoryProvider);
  return repo.fetchRecipes(query, filter);
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
