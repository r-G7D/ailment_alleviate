// ignore_for_file: prefer_final_fields

// import 'package:flutter/material.dart';
import 'package:ailment_alleviate/layers/domain/addIngredient/add_ingredient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/filter/filter.dart';

enum Role { user, maker }

final roleProvider = StateProvider<Role>((ref) {
  return Role.user;
});

final emperisProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final queryProvider = StateProvider<String>((ref) {
  return '';
});

final filterProvider = StateProvider<String>((ref) {
  return '';
});

final idProvider = StateProvider<int>((ref) {
  return 0;
});

final recipePageProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class FilterNotifier extends StateNotifier<Filter> {
  FilterNotifier() : super(Filter(filters: []));
  List<String> filters = [];

  addFilter(String filter) {
    filters.add(filter);
    state = state.copyWith(filters: filters);
  }

  removeFilter(String filter) {
    filters.remove(filter);
    state = state.copyWith(filters: filters);
  }

  clearFilter() {
    filters = [];
    state = state.copyWith(filters: filters);
  }
}

final filterStateProvider =
    StateNotifierProvider.autoDispose<FilterNotifier, Filter>(
        (ref) => FilterNotifier());

//state add ingredient on create recipe
class AddIngredientsNotifier extends StateNotifier<AddIngredient> {
  AddIngredientsNotifier() : super(AddIngredient(ingredients: []));

  addIngredient(String ing) {
    state = state.copyWith(ingredients: [...state.ingredients, ing]);
  }

  removeIngredient(String ing) {
    state = state.copyWith(
        ingredients: [...state.ingredients.where((element) => element != ing)]);
  }
}

final addIngsProvider =
    StateNotifierProvider<AddIngredientsNotifier, AddIngredient>((ref) {
  return AddIngredientsNotifier();
});

// class Emperis1Provider with ChangeNotifier {
//   int _active = 0;
//   int _page = 0;
//   int get page => _page;
//   PageController _pageController = PageController();
//   PageController get pageController => _pageController;
//   int get active => _active;

//   setPage(int index) {
//     _page = index;
//     pageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//     notifyListeners();
//   }

//   setActive(int index) {
//     _active = index;
//     notifyListeners();
//   }
// }
