import 'dart:developer';
import 'dart:io';

import 'package:ailment_alleviate/layers/domain/maker/maker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../api/api_service.dart';

part 'maker_repository.g.dart';

class MakerRepository {
  final Dio dio = Dio();
  final APIService api = APIService();
  var storage = const FlutterSecureStorage();

  Future<Maker> fetchMaker() async {
    Uri uri = api.dashboardMaker();
    var token = await storage.read(key: 'token');
    log(token.toString());

    final response = await api.runFetch(
      request: () => dio.getUri(
        uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      ),
      parse: (json) => Maker.fromJson(json),
    );
    return response;
  }

  Future createRecipe() async {
    Uri uri = api.createRecipe();
    var token = await storage.read(key: 'token');

    final response = await api.runCRUD(
      request: () => dio.getUri(
        uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      ),
      parse: (json) => json,
    );
    return response;
  }

  Future createIngredient(String name, String desc, File img) async {
    dynamic data = {
      'nama_bahan': name,
      'keterangan': desc,
      'gambar': await MultipartFile.fromFile(
        img.path,
        filename: img.path.split('/').last,
        // contentType: MediaType('image', 'png'),
      ),
    };
    Uri uri = api.createIngredient();
    var token = await storage.read(key: 'token');
    log(data.toString());
    log(uri.toString());

    final response = await api.runCRUD(
      request: () => dio.postUri(
        uri,
        data: data,
        options: Options(
          headers: {
            // 'Content-Type':
            //     'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW',
            'Authorization': 'Bearer $token',
          },
        ),
      ),
      parse: (json) => json,
    );
    return response;
  }
}

@Riverpod(keepAlive: true)
MakerRepository makerRepository(MakerRepositoryRef ref) {
  return MakerRepository();
}
