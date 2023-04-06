import 'package:flutter_riverpod/flutter_riverpod.dart';

final acceptedProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final pendingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final declinedProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final accountCardProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
