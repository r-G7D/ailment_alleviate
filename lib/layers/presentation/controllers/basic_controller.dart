import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recipePage = Provider<PageController>((ref) {
  return PageController();
});

final queryC = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
