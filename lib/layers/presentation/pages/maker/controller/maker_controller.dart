import 'dart:developer';

import 'package:ailment_alleviate/layers/presentation/states/basic_state.dart';
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
    await storage.write(key: 'token', value: '');
    router.pushReplacement('/');
  }
}

//maker
final makerProvider = FutureProvider<Maker>((ref) async {
  var repo = ref.watch(makerRepositoryProvider);
  return repo.fetchMaker();
});

final recipeNameProvider = StateProvider<String>((ref) {
  return '';
});

final recipeDescProvider = StateProvider<String>((ref) {
  return '';
});

final recipeUsageProvider = StateProvider<String>((ref) {
  return '';
});

final recipeStepProvider = StateProvider<String>((ref) {
  return '';
});

final createRecipeProvider = FutureProvider<dynamic>((ref) async {
  var repo = ref.watch(makerRepositoryProvider);
  var name = ref.watch(recipeNameProvider);
  var desc = ref.watch(recipeDescProvider);
  var usage = ref.watch(recipeUsageProvider);
  var steps = ref.watch(recipeStepProvider);
  var ingredients = ref.read(addIngsProvider).ingredients;
  var img = ref.read(inputImgCreateRecipeProvider.notifier).state;
  return repo.createRecipe(name, desc, usage, steps, img!, ingredients);
});

final ingredientNameProvider = StateProvider<String>((ref) {
  return '';
});

final ingredientDescProvider = StateProvider<String>((ref) {
  return '';
});

final createIngredientProvider = FutureProvider<dynamic>((ref) async {
  var repo = ref.watch(makerRepositoryProvider);
  var name = ref.watch(ingredientNameProvider);
  var desc = ref.watch(ingredientDescProvider);
  var img = ref.read(inputImgCreateIngProvider.notifier).state;
  return repo.createIngredient(name, desc, img!);
});
