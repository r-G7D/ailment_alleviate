import 'dart:developer';

import 'package:ailment_alleviate/api/api_service.dart';
import 'package:ailment_alleviate/layers/domain/filter/filter.dart';
import 'package:ailment_alleviate/layers/domain/ingredient/ingredient.dart';
import 'package:ailment_alleviate/layers/domain/recipe/recipe.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/states/basic_state.dart';

part 'dashboard_repo.g.dart';

class DashboardRepository {
  final Dio dio = Dio();
  final APIService api = APIService();

  Future<List<Recipe>> fetchRecipes(String? query, String? filter) async {
    final param = {
      'search': '${query!} ${filter!}',
    };
    Uri uri = api.dashboard(param);
    log(uri.toString());
    final response = await api.run(
      request: () => dio.getUri(
        uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
      parse: (json) => (json as List).map((e) => Recipe.fromJson(e)).toList(),
    );
    return response;
  }

  Future<Recipe> fetchRecipe(int id) async {
    Uri uri = api.dashboardId(id.toString());
    final response = await api.run(
      request: () => dio.getUri(
        uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
      parse: (json) => Recipe.fromJson(json),
    );
    return response;
  }

  Future<List<Ingredient>> fetchIngredients() async {
    Uri uri = api.ingredient();
    final response = await api.run(
      request: () => dio.getUri(
        uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
      // parse: (json) => (json['bahan'] as List)
      //     .map((e) => Ingredient.fromJson(e))
      //     .toList(),
      parse: (json) =>
          (json as List).map((e) => Ingredient.fromJson(e)).toList(),
    );
    return response;
  }
}

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepository();
}

class FilterNotifier extends StateNotifier<Filter> {
  FilterNotifier() : super(Filter(filters: []));
  List<String> filters = [];

  addFilter(String filter) {
    filters.add(filter);
    state = state.copyWith(filters: filters);
  }

  removeFilter(String filter) {
    filters.remove(filter);
    state = state.copyWith(filters: filters);
  }

  clearFilter() {
    filters = [];
    state = state.copyWith(filters: filters);
  }
}

final filterStateProvider =
    StateNotifierProvider.autoDispose<FilterNotifier, Filter>(
        (ref) => FilterNotifier());

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









// class DashboardProvider extends ChangeNotifier {
//   List<String> _filters = [];
//   List<String> get filters => _filters;

//   void addFilter(String filter) {
//     _filters.add(filter);
//     notifyListeners();
//   }

//   void removeFilter(String filter) {
//     _filters.remove(filter);
//     notifyListeners();
//   }

//   void clearFilter() {
//     _filters.clear();
//     notifyListeners();
//   }
// }
