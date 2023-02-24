import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ApiService {
  static const String _baseUrl = 'deployailment.pythonanywhere.com';

  Future<T> run<T>({
    required Future<Response> Function() request,
    required T Function(dynamic) parse,
  }) async {
    try {
      // add artificial delay to test loading UI
      //await Future.delayed(const Duration(seconds: 1));
      final response = await request();
      switch (response.statusCode) {
        case 200:
          return parse(response.data);
        case 201:
          return parse(response.data);
        case 204:
          return parse(response.data);
        default:
          throw Exception();
        // case 404:
        //   throw const APIError.notFound();
        // default:
        //   throw const APIError.unknown();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    //  on SocketException catch (_) {
    //   throw const APIError.noInternetConnection();
    // }
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
}

final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);

// @riverpod
// ApiService apiProvider(ApiProviderRef ref) {
//   return ApiService();
// }

/**
 * *riverpod generator
 * *1. import anotation
 * *2. add part file (.g.dart)
 * *3. add @riverpod
 * *4. add function
 * *5. run flutter pub run build_runner build
**/
