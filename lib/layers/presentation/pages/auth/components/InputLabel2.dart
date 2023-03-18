import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants/custom_style.dart';
import '../state/auth_state.dart';

class InputLabel2 extends ConsumerStatefulWidget {
  InputLabel2({
    Key? key,
    required this.label,
    this.isSertifikat,
    this.controller,
    this.isObscure,
  }) : super(key: key);

  final String? label;
  final bool? isObscure;
  final TextEditingController? controller;
  final bool? isSertifikat;

  @override
  ConsumerState<InputLabel2> createState() => _InputLabel2State();
}

class _InputLabel2State extends ConsumerState<InputLabel2> {
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
        widget.isSertifikat == true
            ? ref.read(sertifikatFileProvider.notifier).state = _imageFile!
            : ref.watch(pendukungFileProvider.notifier).state = _imageFile!;
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
          controller: widget.controller,
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