// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class EmperisProvider with ChangeNotifier {
  int _active = 0;
  dynamic _colorList = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
  ];
  dynamic get colorList => _colorList;
  int get active => _active;

  setActive(int index) {
    _active = index;
    notifyListeners();
  }
}
