// ignore_for_file: prefer_final_fields

// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final acceptedProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final pendingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
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
