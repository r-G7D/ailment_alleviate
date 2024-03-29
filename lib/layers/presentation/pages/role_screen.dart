import 'dart:developer';

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/presentation/controllers/basic_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/router.dart';
import '../states/basic_state.dart';

class RoleScreen extends ConsumerWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String token = ref.watch(tokenProvider);

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                roleItem('User', 'home', ref),
                roleItem('Peracik', token == '' ? 'login' : 'maker', ref),
              ],
            ),
          )),
    );
  }

  Widget roleItem(String role, String path, WidgetRef ref) {
    return InkWell(
      onTap: () {
        router.pushNamed(path);
        role == 'Peracik'
            ? ref.read(roleProvider.notifier).state = Role.maker
            : ref.read(roleProvider.notifier).state = Role.user;
        log(ref.read(roleProvider).toString());
      },
      child: Container(
        height: 105,
        width: 105,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: kElevationToShadow[2],
        ),
        child: Center(
          child: Text(
            role,
            style: GoogleFonts.lato(
              textStyle: Typo.title.copyWith(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
