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

  Future<Map<String, dynamic>> login(String email, String password) async {
    var storage = new FlutterSecureStorage();

    final param = {
      'email': email,
      'password': password,
    };
    log("param : $param");
    Uri uri = api.login();
    log("uri:$uri");
    final response = await api.run(
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
    await storage.write(key: 'token', value: response['token']['access']);
    var token = await storage.read(key: 'token');
    log(token.toString());
    return response;
  }

  Future<Map<String, dynamic>> register(
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
    final response = await api.run(
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

final loginProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  var email = ref.watch(emailProvider);
  var password = ref.watch(passwordProvider);
  return ref.watch(authRepositoryProvider).login(email, password);
});

final registerProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  var name = ref.watch(nameProvider);
  // log(name);
  var email = ref.watch(emailProvider);
  // log(email);
  var password = ref.watch(passwordProvider);
  // log(password);
  var confirmPassword = ref.watch(confirmpasswordProvider);
  // log(confirmPassword);
  var address = ref.watch(addressProvider);
  // log(address);
  var phone = ref.watch(phoneProvider);
  // log(phone);
  var pendukungFile = ref.watch(pendukungFileProvider);
  // log(pendukungFile.toString());
  var sertifikatFile = ref.watch(sertifikatFileProvider);
  // log(sertifikatFile.toString());
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
