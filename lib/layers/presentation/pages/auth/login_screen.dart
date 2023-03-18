// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:ailment_alleviate/layers/data/auth/auth_repository.dart';
import 'package:ailment_alleviate/layers/presentation/pages/auth/components/auth_dialog.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/InputLabel.dart';

import '../../../../constants/custom_style.dart';
import 'state/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Alleviate',
                    style: GoogleFonts.comfortaa(
                      textStyle: Typo.title.copyWith(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Halo',
                    style: GoogleFonts.comfortaa(
                      textStyle: Typo.title.copyWith(
                        color: white,
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'Silahkan isi detail login anda',
                    style: GoogleFonts.comfortaa(
                      textStyle: Typo.title.copyWith(
                        color: secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
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
                  InputLabel(
                    label: 'Masukkan Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),
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
                    label: 'Masukkan Password',
                    controller: passwordController,
                    isObscure: true,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ref.read(emailProvider.notifier).state =
                          emailController.text;
                      //ngeset nilai email provider dari email controller
                      ref.read(passwordProvider.notifier).state =
                          passwordController.text;
                      //ngeset nilai password provider dari password controller
                      showDialog(
                          context: context,
                          builder: (context) => AuthDialog(
                                isLogin: true,
                              ));
                    },
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
                          'Login',
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
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    width: 327,
                    height: 46,
                    decoration: BoxDecoration(
                      color: primary,
                      border: Border.all(
                        color: white!,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'Register',
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
                      onTap: () {
                        router.pushNamed('register');
                        log('register');
                      },
                    ),
                  )
                  // Container(
                  //   padding: EdgeInsets.only(left: 34, right: 34),
                  //   child: TextField(
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       border: UnderlineInputBorder(),
                  //       enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: secondary!),
                  //       ),
                  //       focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: secondary!),
                  //       ),
                  //       hintText: 'Masukkan password anda',
                  //       hintStyle: GoogleFonts.comfortaa(
                  //         textStyle: Typo.title.copyWith(
                  //           color: white,
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
