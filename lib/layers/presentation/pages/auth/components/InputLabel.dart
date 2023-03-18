import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/custom_style.dart';

class InputLabel extends StatelessWidget {
  InputLabel({
    super.key,
    required this.label,
    required this.controller,
    this.isObscure,
  });
  final String? label;
  final TextEditingController controller;
  bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: GoogleFonts.comfortaa(
          textStyle: Typo.title.copyWith(
            color: white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        controller: controller,
        obscureText: isObscure ?? false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: white!),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: white!),
          ),
          hintText: label,
          hintStyle: GoogleFonts.comfortaa(
            textStyle: Typo.title.copyWith(
              color: white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
