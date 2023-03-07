// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 47, left: 34),
                  child: Text(
                    'Alleviate',
                    style: GoogleFonts.comfortaa(
                      textStyle: Typo.title.copyWith(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 21, left: 34, right: 54),
                  child: Text(
                    'Bergabung bersama kami',
                    style: GoogleFonts.comfortaa(
                      textStyle: Typo.title.copyWith(
                        color: white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 17, left: 34),
                  child: Text(
                    'Silahkan isi data diri anda',
                    style: GoogleFonts.comfortaa(
                      textStyle: Typo.title.copyWith(
                        color: secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 320,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [register(), verif()],
                  ),
                ),
                SizedBox(
                  height: 111,
                ),
                Container(
                    child: Row(children: [
                  SizedBox(
                    width: 32,
                  ),
                  InkWell(
                    child: Container(
                      width: 327,
                      height: 46,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'Daftar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                            textStyle: Typo.title.copyWith(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (pageController.page == 0) {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      } else if (pageController.page == 1) {
                        router.pop();
                      }
                    },
                  )
                ])),
                SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 34,
                    ),
                    InkWell(
                      child: Container(
                        width: 327,
                        height: 46,
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(
                            color: white!,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            'Kembali',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.comfortaa(
                              textStyle: Typo.title.copyWith(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (pageController.page == 1) {
                          pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        } else if (pageController.page == 0) {
                          router.pop();
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget register() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Nama',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        InputLabel(label: 'Masukkan Nama'),
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Email',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        InputLabel(label: 'Masukkan Email'),
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Password',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        InputLabel(
          label: 'Masukkan Password',
          isOsecure: true,
        ),
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Konfirmasi Password',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
        InputLabel(
          label: 'Masukkan Password',
          isOsecure: true,
        ),
      ],
    );
  }

  Widget verif() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Alamat',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        InputLabel(label: 'Masukkan Alamat'),
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Nomor Telepon',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        InputLabel(label: 'Masukkan Nomor Telepon'),
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Gambar Pendukung',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        InputLabel2(
          label: 'Pilih Gambar Pendukung',
          isOsecure: true,
        ),
        Container(
          padding: EdgeInsets.only(top: 15, left: 34),
          child: Text(
            'Sertifikat',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ),
        InputLabel2(
          label: 'Pilih Sertifikat',
          isOsecure: true,
        ),
      ],
    );
  }
}

class InputLabel extends StatelessWidget {
  InputLabel({
    super.key,
    required this.label,
    this.isOsecure,
  });
  final String? label;
  bool? isOsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 34, right: 34),
      child: TextField(
        style: GoogleFonts.comfortaa(
          textStyle: Typo.title.copyWith(
            color: white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        obscureText: isOsecure ?? false,
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

class InputLabel2 extends StatelessWidget {
  InputLabel2({
    super.key,
    required this.label,
    this.isOsecure,
  });
  final String? label;
  bool? isOsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 34, right: 34),
      child: TextField(
        style: GoogleFonts.comfortaa(
          textStyle: Typo.title.copyWith(
            color: white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        obscureText: isOsecure ?? false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.camera_alt_rounded,
            color: white,
          ),
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
