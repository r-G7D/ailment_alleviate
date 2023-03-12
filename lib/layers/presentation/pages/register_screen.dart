// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';
import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
          InputLabel(label: 'Masukkan Email'),
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
          InputLabel(label: 'Masukkan Alamat'),
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
          InputLabel(label: 'Masukkan Nomor Telepon'),
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
            label: 'Pilih Sertifikat',
            isObscure: true,
          ),
        ],
      ),
    );
  }
}

class InputLabel extends StatelessWidget {
  InputLabel({
    super.key,
    required this.label,
    this.isObscure,
  });
  final String? label;
  bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (value) {
          print(value);
        },
        style: GoogleFonts.comfortaa(
          textStyle: Typo.title.copyWith(
            color: white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
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

class InputLabel2 extends StatefulWidget {
  InputLabel2({
    Key? key,
    required this.label,
    this.isObscure,
  }) : super(key: key);

  final String? label;
  final bool? isObscure;

  @override
  _InputLabel2State createState() => _InputLabel2State();
}

class _InputLabel2State extends State<InputLabel2> {
  File? _imageFile;

  Future<void> _pickImage(BuildContext context) async {
    final dialogResult = await showDialog<int>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Select an image'),
        actions: <Widget>[
          TextButton(
            child: Text('Camera'),
            onPressed: () {
              Navigator.pop(context, 0);
            },
          ),
          TextButton(
            child: Text('Gallery'),
            onPressed: () {
              Navigator.pop(context, 1);
            },
          ),
        ],
      ),
    );

    if (dialogResult == null) {
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: dialogResult == 0 ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_imageFile!.path)),
      );
    }
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imageFile != null
            ? Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: white,
                      ),
                      child: Image.file(
                        _imageFile!,
                        height: 280,
                        width: 200,
                      )),
                ],
              )
            : SizedBox(),
        SizedBox(height: 16),
        TextField(
          style: GoogleFonts.comfortaa(
            textStyle: Typo.title.copyWith(
              color: white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          readOnly: true,
          onTap: () {
            _pickImage(context);
          },
          decoration: InputDecoration(
            prefixIcon: _imageFile != null
                ? IconButton(
                    icon: Icon(Icons.clear),
                    color: Colors.white,
                    onPressed: _clearImage,
                  )
                : null,
            suffixIcon: IconButton(
              icon: Icon(Icons.camera_alt),
              color: white,
              onPressed: () {
                _pickImage(context);
              },
            ),
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: white!),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: white!),
            ),
            hintText: _imageFile != null ? _imageFile!.path : widget.label,
            hintStyle: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(
                color: white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
