import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../api/api_service.dart';
import '../../presentation/pages/auth/state/auth_state.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio dio = Dio();
  final APIService api = APIService();

  Future login(String email, String password) async {
    var storage = const FlutterSecureStorage();

    final param = {
      'email': email,
      'password': password,
    };
    log("param : $param");
    Uri uri = api.login();
    log("uri:$uri");
    final response = await api.runCRUD(
      request: () => dio.postUri(
        uri,
        data: param,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
      parse: (json) => json,
    );
    if (response['token'] != null) {
      await storage.write(key: 'token', value: response['token']['access']);
      return response;
    }
  }

  Future register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String address,
    String phone,
    File pendukungFile,
    File sertifikatFile,
  ) async {
    // Set form data
    final formData = {
      'username': name,
      'email': email,
      'password': password,
      'password_2': confirmPassword,
      'data_peracik': {
        'alamat': address,
        'no_hp': phone,
        'gambar_pendukung': await MultipartFile.fromFile(
          pendukungFile.path,
          contentType: MediaType('image', 'jpeg'),
        ),
        'sertifikat': await MultipartFile.fromFile(
          sertifikatFile.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      }
    };
    log("form data : $formData");
    // Send request
    Uri uri = api.register();
    log(uri.toString());
    final response = await api.runCRUD(
      request: () => dio.postUri(
        uri,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      ),
      parse: (json) => json,
    );
    log("response $response");
    return response;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}
