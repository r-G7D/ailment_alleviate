// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/custom_style.dart';
import '../../../routes/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => router.pushNamed('login'));
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
