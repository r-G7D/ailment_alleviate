import 'dart:developer';

import 'package:ailment_alleviate/layers/data/maker_repository/maker_repository.dart';
import 'package:ailment_alleviate/layers/presentation/pages/maker/controller/maker_controller.dart';
import 'package:ailment_alleviate/layers/presentation/pages/maker/create/component/img_preview.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants/custom_style.dart';
import '../../../components/form_field.dart';
import '../../../states/image_state.dart';
import 'component/create_dialog.dart';

class CreateIngredientScreen extends ConsumerStatefulWidget {
  const CreateIngredientScreen({super.key});

  @override
  ConsumerState<CreateIngredientScreen> createState() =>
      _CreateIngredientScreenState();
}

class _CreateIngredientScreenState
    extends ConsumerState<CreateIngredientScreen> {
  final _nameC = TextEditingController();
  final _descC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    XFile? previewImage = ref.watch(inputImgCreateIngProvider);

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: Text(
          'Tambah Bahan',
          style: GoogleFonts.comfortaa(textStyle: Typo.title),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Divider(
              thickness: 4,
              color: grey,
              endIndent: 43,
              indent: 43,
            )),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                previewImage == null
                    ? ImagePickerButton(
                        setFunction: () {
                          showChooseImage(
                              context,
                              ref
                                  .read(inputImgCreateIngProvider.notifier)
                                  .setImage);
                        },
                      )
                    : DeleteImageButton(setFunction: () {
                        ref.read(inputImgCreateIngProvider.notifier).state =
                            null;
                      }),
                const SizedBox(width: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 165,
                  child: CustomFormField(
                      controller: _nameC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tidak boleh kosong';
                        }
                        return null;
                      },
                      hintText: 'Nama Bahan'),
                )
              ],
            ),
            previewImage == null
                ? const SizedBox()
                : Column(
                    children: [
                      const SizedBox(height: 16),
                      ImagePreview(filePic: previewImage),
                    ],
                  ),
            const SizedBox(height: 16),
            CustomFormField(
                controller: _descC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tidak boleh kosong';
                  }
                  return null;
                },
                hintText: 'Keterangan'),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 36,
                  width: 75,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Batal',
                      style: GoogleFonts.lato(
                          textStyle: Typo.paragraph.copyWith(
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                Container(
                  height: 36,
                  width: 150,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextButton(
                    onPressed: () {
                      ref.read(ingredientNameProvider.notifier).state =
                          _nameC.text;
                      ref.read(ingredientDescProvider.notifier).state =
                          _descC.text;
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const CreateDialog(
                            type: 'bahan',
                          );
                        },
                      );
                    },
                    child: Text(
                      'Tambah',
                      style: GoogleFonts.lato(
                          textStyle: Typo.paragraph.copyWith(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: white,
        height: 62,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ailment Alleviate',
              style: GoogleFonts.comfortaa(
                  textStyle: Typo.title.copyWith(color: primary)),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
