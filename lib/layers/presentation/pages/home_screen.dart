// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/custom_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 57,
              left: 0,
            ),
            child: Text(
              'Validitas Obat',
              style: GoogleFonts.comfortaa(
                textStyle: Typo.title.copyWith(
                  color: black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 100,
            ),
            width: 500,
            height: 300,
            child: Stack(
              children: [
                Positioned(
                  width: 294,
                  height: 130,
                  top: 60,
                  left: 48,
                  child: Container(
                      decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 60,
                            ),
                            child: Text(
                              'Emperis',
                              style: GoogleFonts.comfortaa(
                                textStyle: Typo.title.copyWith(
                                  color: black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 3,
                            ),
                            child: Text(
                              'Ramuan yang sudah terbukti dan teruji',
                              style: GoogleFonts.comfortaa(
                                textStyle: Typo.title.copyWith(
                                  color: black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Positioned(
                  width: 100,
                  height: 100,
                  top: 0,
                  left: 145,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onTap: () {
                      router.pushNamed('emperis');
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 33,
            ),
            width: 500,
            height: 300,
            child: Stack(
              children: [
                Positioned(
                  width: 294,
                  height: 130,
                  top: 60,
                  left: 48,
                  child: Container(
                      decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 60,
                            ),
                            child: Text(
                              'Intuitif',
                              style: GoogleFonts.comfortaa(
                                textStyle: Typo.title.copyWith(
                                  color: black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 3,
                            ),
                            child: Text(
                              'Ramuan yang dibuat berdasarkan perkiraan',
                              style: GoogleFonts.comfortaa(
                                textStyle: Typo.title.copyWith(
                                  color: black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Positioned(
                  width: 100,
                  height: 100,
                  top: 0,
                  left: 145,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 90,
            ),
            child: Text(
              'Ailment Alleviate',
              style: GoogleFonts.comfortaa(
                textStyle: Typo.title.copyWith(color: primary),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
