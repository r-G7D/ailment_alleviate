import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) {
  return '';
});

final passwordProvider = StateProvider<String>((ref) {
  return '';
});

final confirmpasswordProvider = StateProvider<String>((ref) {
  return '';
});

final nameProvider = StateProvider<String>((ref) {
  return '';
});

final addressProvider = StateProvider<String>((ref) {
  return '';
});

final phoneProvider = StateProvider<String>((ref) {
  return '';
});

final pendukungFileProvider = StateProvider<File>((ref) {
  return File('/');
});

final sertifikatFileProvider = StateProvider<File>((ref) {
  return File('/');
});
