// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class EmperisProvider with ChangeNotifier {
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
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  setActive(int index) {
    _active = index;

    notifyListeners();
  }
}
