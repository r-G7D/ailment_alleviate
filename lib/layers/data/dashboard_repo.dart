import 'dart:developer';

import 'package:ailment_alleviate/api/api_service.dart';
import 'package:ailment_alleviate/layers/domain/filter/filter.dart';
import 'package:ailment_alleviate/layers/domain/recipe/recipe.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_repo.g.dart';

class DashboardRepository {
  final Dio dio = Dio();
  final ApiService api = ApiService();

  Future<List<Recipe>> fetchRecipes() async {
    Uri uri = api.dashboard;
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
    log(uri.toString());
    log(response.toString());
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

final filterProvider =
    StateNotifierProvider<FilterNotifier, Filter>((ref) => FilterNotifier());










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
