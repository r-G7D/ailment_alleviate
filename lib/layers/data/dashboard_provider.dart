import 'package:flutter/material.dart';

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
