
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emperisProvider = StateProvider<int>((ref) {
  return 0;
});

class Emperis1Provider with ChangeNotifier {
  int _active = 0;
  int _page = 0;
  int get page => _page;
  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  int get active => _active;

  setPage(int index) {
    _page = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  setActive(int index) {
    _active = index;
    notifyListeners();
  }
}
