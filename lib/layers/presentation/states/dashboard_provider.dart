
import 'package:ailment_alleviate/layers/domain/filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final filterProvider = StateProvider<List<String>>((ref) {
//   return [];
// });

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

final filterProvider =
    StateNotifierProvider<FilterNotifier, Filter>((ref) => FilterNotifier());

class DashboardProvider extends ChangeNotifier {
  List<String> _filters = [];
  List<String> get filters => _filters;

  void addFilter(String filter) {
    _filters.add(filter);
    notifyListeners();
  }

  void removeFilter(String filter) {
    _filters.remove(filter);
    notifyListeners();
  }

  void clearFilter() {
    _filters.clear();
    notifyListeners();
  }
}
