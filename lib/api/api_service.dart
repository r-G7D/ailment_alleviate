import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class APIService {
  // static const String _baseUrl =
  // 'suggesting-key-bangladesh-va.trycloudflare.com';
  static const String _baseUrl = 'deployailment.pythonanywhere.com';

  Future<T> runCRUD<T>({
    required Future<Response> Function() request,
    T Function(dynamic)? parse,
  }) async {
    try {
      final response = await request();
      dynamic parsed = parse != null ? parse(response.data) : null;
      return parsed;
    } on SocketException catch (_) {
      throw Exception('No Internet Connection');
    } on DioError catch (e) {
      throw Exception(e.response!.data);
    }
  }

  Future<T> runFetch<T>({
    required Future<Response> Function() request,
    required T Function(dynamic) parse,
  }) async {
    try {
      final response = await request();
      return parse(response.data);
    } on SocketException catch (_) {
      throw Exception('No Internet Connection');
    } on DioError catch (e) {
      throw Exception(e.response!.data);
    }
  }

  Uri _buildUri({
    required String endpoint,
    Map<String, dynamic>? params,
  }) {
    return Uri(
      scheme: "https",
      host: _baseUrl,
      path: endpoint,
      queryParameters: params,
    );
  }

  Uri dashboard(Map<String, dynamic>? params) {
    return _buildUri(
      endpoint: '/dashboard',
      params: params,
    );
  }

  Uri login() {
    return _buildUri(
      endpoint: '/api/peracik/login/',
    );
  }

  Uri register() {
    return _buildUri(
      endpoint: '/api/peracik/signup/',
    );
  }

  Uri dashboardId(String id) {
    return _buildUri(
      endpoint: '/dashboard/$id',
    );
  }

  Uri ingredient() {
    return _buildUri(
      endpoint: '/bahan',
    );
  }

  Uri ingredientId(String id) {
    return _buildUri(
      endpoint: '/bahan/$id',
    );
  }

  Uri createRecipe() {
    return _buildUri(
      endpoint: '/api/peracik/create/',
    );
  }

  Uri createIngredient() {
    return _buildUri(
      endpoint: '/api/peracik/',
    );
  }
}

final apiProvider = Provider<APIService>(
  (ref) => APIService(),
);

/**
 * *riverpod generator
 * *1. import anotation
 * *2. add part file (.g.dart)
 * *3. add @riverpod
 * *4. add function
 * *5. run flutter pub run build_runner build
**/
