import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
            log('success');
            return Text('success');
          },
          //builder ketika error
          error: (error, stack) {
            log('error');
            return Text(error.toString());
          },
          //builder ketika loading
          loading: () {
            log('loading');
            return Center(
              child: LoadingWidget(),
            );
          },
        ),
      ),
    );
  }
}
