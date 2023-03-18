// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:developer';
import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/presentation/pages/auth/components/auth_dialog.dart';
import 'package:ailment_alleviate/layers/presentation/pages/auth/state/auth_state.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/auth/auth_repository.dart';
import 'components/InputLabel.dart';
import 'components/InputLabel2.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pendukungFileController = TextEditingController();
  TextEditingController sertifikatFileController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    addressController.dispose();
    phoneController.dispose();
    pendukungFileController.dispose();
    sertifikatFileController.dispose();
    super.dispose();
  }

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
                        ref.read(nameProvider.notifier).state =
                            nameController.text;
                        ref.read(emailProvider.notifier).state =
                            emailController.text;
                        ref.read(passwordProvider.notifier).state =
                            passwordController.text;
                        ref.read(confirmpasswordProvider.notifier).state =
                            confirmpasswordController.text;
                        ref.read(addressProvider.notifier).state =
                            addressController.text;
                        ref.read(phoneProvider.notifier).state =
                            phoneController.text;
                        showDialog(
                            context: context,
                            builder: (context) => AuthDialog(isLogin: false));
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
                      width: 32,
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
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Nama',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InputLabel(
            controller: nameController,
            label: 'Masukkan Nama',
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Email',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InputLabel(controller: emailController, label: 'Masukkan Email'),
          SizedBox(
            height: 15,
          ),
          Text(
            'Password',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InputLabel(
            controller: passwordController,
            label: 'Masukkan Password',
            isObscure: true,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Konfirmasi Password',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          InputLabel(
            controller: confirmpasswordController,
            label: 'Masukkan Password',
            isObscure: true,
          ),
        ],
      ),
    );
  }

  Widget verif() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListView(
        padding: EdgeInsets.only(left: 34, right: 34),
        children: [
          Text(
            'Alamat',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InputLabel(controller: addressController, label: 'Masukkan Alamat'),
          SizedBox(
            height: 15,
          ),
          Text(
            'Nomor Telepon',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InputLabel(
              controller: phoneController, label: 'Masukkan Nomor Telepon'),
          SizedBox(
            height: 15,
          ),
          Text(
            'Gambar Pendukung',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InputLabel2(
            isSertifikat: false,
            label: 'Pilih Gambar Pendukung',
            isObscure: true,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Sertifikat',
            style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: secondary,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          InputLabel2(
            isSertifikat: true,
            label: 'Pilih Sertifikat',
            isObscure: true,
          ),
        ],
      ),
    );
  }
}
