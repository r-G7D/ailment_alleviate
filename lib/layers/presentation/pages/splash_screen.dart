// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:async';
import 'package:ailment_alleviate/layers/presentation/controllers/basic_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/custom_style.dart';
import '../../../routes/router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(basicControllerProvider.notifier).checkToken();
    Timer(Duration(seconds: 2), () => router.pushNamed('role'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Text('Alleviate',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: white,
                fontSize: 60,
                fontWeight: FontWeight.w700,
              ),
            )),
      ),
    );
  }
}
