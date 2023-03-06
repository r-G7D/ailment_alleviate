import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/custom_style.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: black,
      validator: validator,
      style: GoogleFonts.comfortaa(
          textStyle: Typo.paragraph.copyWith(color: black, fontSize: 16)),
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: grey,
        hintStyle: GoogleFonts.comfortaa(
            textStyle: Typo.paragraph.copyWith(color: grey, fontSize: 16)),
        focusedBorder: const UnderlineInputBorder(),
      ),
    );
  }
}
