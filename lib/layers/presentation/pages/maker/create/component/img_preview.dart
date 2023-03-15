import 'dart:io';

import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../constants/custom_style.dart';
import '../../../../states/image_state.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.filePic,
    this.urlPic,
    this.label,
  });

  final File? filePic;
  final String? urlPic;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Builder(builder: (_) {
        if (filePic != null) {
          return Image.file(
            filePic!,
            fit: BoxFit.fitHeight,
            height: 200,
          );
        } else {
          return Image.network(
            urlPic!,
            fit: BoxFit.fitHeight,
            height: 200,
            errorBuilder: (context, error, stackTrace) {
              debugPrint('[$label], Error: $error');
              return const SizedBox(
                height: 200,
                child: Icon(
                  Icons.error_outline,
                  color: Colors.black,
                ),
              );
            },
          );
        }
      }),
    );
  }
}

class ImagePickerButton extends ConsumerWidget {
  final Function() setFunction;
  const ImagePickerButton({
    required this.setFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: setFunction,
        child: Icon(
          Boxicons.bx_camera,
          color: white,
        ),
      ),
    );
  }
}

void showChooseImage(BuildContext context, Function fnc) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext bc) {
      return Container(
        margin: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      fnc(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 48,
                          color: primary,
                        ),
                        Text(
                          'Kamera',
                          style: GoogleFonts.lato(textStyle: Typo.paragraph),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      fnc(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo,
                          size: 48,
                          color: primary,
                        ),
                        Text(
                          'Galeri',
                          style: GoogleFonts.lato(textStyle: Typo.paragraph),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
