import 'dart:convert';
import 'dart:developer';

import 'package:ailment_alleviate/layers/domain/maker/maker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../../../api/api_service.dart';
import '../../domain/ingredient/ingredient.dart';

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

  Future createRecipe(String name, String desc, String steps, String usage,
      XFile img, List<Ingredient> ingredients) async {
    // List ingredientsList = [];
    // for (var i = 0; i < ingredients.length; i++) {
    //   ingredientsList.add(
    //     {'name': ingredients[i].name},
    //   );
    // }

    FormData data = FormData.fromMap(
      {
        'name': name,
        'description': desc,
        'usage_rules': steps,
        'ways_to_use': usage,
        'image': await MultipartFile.fromFile(
          img.path,
          filename: img.path.split('/').last,
        ),
        // 'ingredients': ingredients.map((e) => e.toJson()).toList(),
        // 'ingredients': ingredientsList,
        // 'ingredients[0]name': 'Jahe',
      },
    );
    for (var i = 0; i < ingredients.length; i++) {
      data.fields.add(
        MapEntry(
          'ingredients[$i]name',
          ingredients[i].name,
        ),
      );
    } //* this is the solution for nested json array + image in formdata

    Uri uri = api.createRecipe();
    var token = await storage.read(key: 'token');
    log(uri.toString());
    log(data.fields.toString());

    final response = await api.runCRUD(
      request: () => dio.postUri(
        uri,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      ),
      parse: (json) => json,
    );
    return response;
  }

  Future createIngredient(String name, String desc, XFile img) async {
    FormData data = FormData.fromMap(
      {
        'name': name,
        'description': desc,
        'image': await MultipartFile.fromFile(
          img.path,
          filename: img.path.split('/').last,
        ),
      },
    );
    Uri uri = api.createIngredient();
    var token = await storage.read(key: 'token');
    log(uri.toString());

    final response = await api.runCRUD(
      request: () => dio.postUri(
        uri,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      ),
      parse: (json) => json,
    );
    return response;
  }

  //upload img but http
  Future createIng(String name, String desc, XFile img) async {
    dynamic data = {
      'nama_bahan': name,
      'keterangan': desc,
    };
    Uri uri = api.createIngredient();
    var token = await storage.read(key: 'token');
    log(data.toString());
    log(uri.toString());

    var request = http.MultipartRequest("POST", uri);
    final httpImg = await http.MultipartFile.fromPath('gambar', img.path);

    request.headers.addAll(
      {
        'Authorization': 'Bearer $token',
      },
    );
    request.fields.addAll(data);
    request.files.add(httpImg);

    log(request.toString());
    var response = await request.send();
    log(response.toString());

    return response;
  }
}

@Riverpod(keepAlive: true)
MakerRepository makerRepository(MakerRepositoryRef ref) {
  return MakerRepository();
}
