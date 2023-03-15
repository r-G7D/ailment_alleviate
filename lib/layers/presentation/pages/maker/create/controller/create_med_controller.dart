import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_med_controller.g.dart';

@riverpod
class CreateMedController extends _$CreateMedController {
  @override
  List<String> build() => [];

  setList(List<String> list) {
    state = list;
  }

  addList(String item) {
    state.add(item);
  }

  removeList(String item) {
    state.remove(item);
  }
}
