import 'dart:developer';

import 'package:ailment_alleviate/layers/presentation/states/image_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../routes/router.dart';
import '../../../../data/maker_repository/maker_repository.dart';
import '../../../../domain/maker/maker.dart';

part 'maker_controller.g.dart';

@riverpod
class MakerController extends _$MakerController {
  @override
  FutureOr<void> build() {}
  var storage = const FlutterSecureStorage();

  Future logout() async {
    await storage.delete(key: 'token');
    router.pushReplacement('/');
  }
}

final ingredientNameProvider = StateProvider<String>((ref) {
  return '';
});

final ingredientDescProvider = StateProvider<String>((ref) {
  return '';
});

//maker
final makerProvider = FutureProvider<Maker>((ref) async {
  var repo = ref.watch(makerRepositoryProvider);
  return repo.fetchMaker();
});

final createIngredientProvider = FutureProvider<dynamic>((ref) async {
  var repo = ref.watch(makerRepositoryProvider);
  var name = ref.watch(ingredientNameProvider);
  var desc = ref.watch(ingredientDescProvider);
  var img = ref.read(inputImgCreateIngProvider.notifier).state;
  return repo.createIngredient(name, desc, img!);
});
