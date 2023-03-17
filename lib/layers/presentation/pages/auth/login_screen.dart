// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:ailment_alleviate/layers/data/auth/auth_repository.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // AsyncValue<dynamic> loginP = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: SafeArea(
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
                padding: EdgeInsets.only(top: 100, left: 34),
                child: Text(
                  'Halo',
                  style: GoogleFonts.comfortaa(
                    textStyle: Typo.title.copyWith(
                      color: white,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 17, left: 34),
                child: Text(
                  'Silahkan isi detail login anda',
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
                padding: EdgeInsets.only(top: 109, left: 34),
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
              InputLabel(
                label: 'Masukkan Email',
                controller: emailController,
              ),
              Container(
                padding: EdgeInsets.only(top: 54, left: 34),
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
                controller: passwordController,
                isObscure: true,
              ),
              SizedBox(
                height: 77,
              ),
              Container(
                  child: Row(children: [
                SizedBox(
                  width: 32,
                ),
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
                        builder: (context) => Dialog(
                              child: SizedBox(
                                height: 300,
                                //provider.when == futurebuilder
                                child: ref.watch(loginProvider).when(
                                  //builder ketika sukses
                                  data: (data) {
                                    log(data.toString());
                                    return Text('success');
                                  },
                                  //builder ketika error
                                  error: (error, stack) {
                                    log('error');
                                    return Text(error.toString());
                                  },
                                  //builder ketika loading
                                  loading: () {
                                    log('loading');
                                    return Center(
                                      child: LoadingWidget(),
                                    );
                                  },
                                ),
                              ),
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
                )
              ])),
              SizedBox(
                height: 17,
              ),
              Container(
                  child: Row(children: [
                SizedBox(
                  width: 32,
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
              ]))
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
    );
  }
}

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
      padding: EdgeInsets.only(left: 34, right: 34),
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
