import 'dart:developer';

import 'package:ailment_alleviate/api/api_service.dart';
import 'package:ailment_alleviate/layers/domain/ingredient/ingredient.dart';
import 'package:ailment_alleviate/layers/domain/recipe/recipe.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_repo.g.dart';

class DashboardRepository {
  final Dio dio = Dio();
  final APIService api = APIService();

  Future<List<Recipe>> fetchRecipes(
      String? query, String? filter, String sort) async {
    final param = {
      'search': '${query!} ${filter!}',
      'ordering': sort,
    };
    Uri uri = api.dashboard(param);
    log(uri.toString());
    final response = await api.runFetch(
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
    final response = await api.runFetch(
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
    final response = await api.runFetch(
      request: () => dio.getUri(
        uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
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
