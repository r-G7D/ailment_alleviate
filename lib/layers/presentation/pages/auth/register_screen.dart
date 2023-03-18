import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/presentation/pages/auth/components/auth_dialog.dart';
import 'package:ailment_alleviate/layers/presentation/pages/auth/state/auth_state.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 47),
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
                    const SizedBox(height: 20),
                    Text(
                      'Bergabung bersama kami',
                      style: GoogleFonts.comfortaa(
                        textStyle: Typo.title.copyWith(
                          color: white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      'Silahkan isi data diri anda',
                      style: GoogleFonts.comfortaa(
                        textStyle: Typo.title.copyWith(
                          color: secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Flexible(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [register(), verif()],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        width: 327,
                        height: 46,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 12),
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
                              builder: (context) =>
                                  const AuthDialog(isLogin: false));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 17,
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
                          padding: const EdgeInsets.only(top: 12),
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
                ),
              )
            ],
          ),
        ));
  }

  Widget register() {
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
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
          const SizedBox(
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
          const SizedBox(
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
          const SizedBox(
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
        padding: const EdgeInsets.only(left: 34, right: 34),
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
          const SizedBox(
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
          const SizedBox(
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
          const SizedBox(
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
