import 'dart:developer';

import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/custom_style.dart';
import '../../../../data/auth/auth_repository.dart';

class AuthDialog extends ConsumerWidget {
  const AuthDialog({super.key, required this.isLogin});
  final bool? isLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: SizedBox(
        height: 300,
        //provider.when == futurebuilder
        child:
            ref.watch(isLogin == true ? loginProvider : registerProvider).when(
          //builder ketika sukses
          data: (data) {
            Future.delayed(const Duration(seconds: 1), () {
              router.pushNamed('maker');
            });
            return const Center(
              child: Text('success'),
            );
          },
          //builder ketika error
          error: (error, stack) {
            log(error.toString());
            return const Center(
              child: Text('error'),
            );
          },
          //builder ketika loading
          loading: () {
            return const Center(
              child: LoadingWidget(),
            );
          },
        ),
      ),
    );
  }
}
