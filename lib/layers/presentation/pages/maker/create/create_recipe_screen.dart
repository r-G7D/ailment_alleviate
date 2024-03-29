import 'dart:io';

import 'package:ailment_alleviate/layers/presentation/components/form_field.dart';
import 'package:ailment_alleviate/layers/presentation/pages/maker/controller/maker_controller.dart';
import 'package:ailment_alleviate/layers/presentation/pages/maker/create/component/input_ingredient.dart';
import 'package:ailment_alleviate/layers/presentation/states/image_state.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants/custom_style.dart';
import '../../../../data/dashboard/dashboard_repo.dart';
import '../../../controllers/basic_controller.dart';
import 'component/create_dialog.dart';
import 'component/img_preview.dart';

class CreateRecipeScreen extends ConsumerStatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  ConsumerState<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends ConsumerState<CreateRecipeScreen> {
  final _nameC = TextEditingController();
  final _descC = TextEditingController();
  final _usageC = TextEditingController();
  final _stepC = TextEditingController();
  final _searchC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _descC.dispose();
    _usageC.dispose();
    _stepC.dispose();
    _searchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    XFile? previewImage = ref.watch(inputImgCreateRecipeProvider);

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: Text(
          'Buat Obat',
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
      body: ref.watch(ingredientProvider).when(
            data: (data) {
              return RefreshIndicator(
                color: primary,
                onRefresh: () async {
                  // ref.watch(ingredientProvider);
                  return ref.refresh(ingredientProvider);
                },
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImagePickerButton(
                                    setFunction: () {
                                      showChooseImage(
                                          context,
                                          ref
                                              .read(inputImgCreateRecipeProvider
                                                  .notifier)
                                              .setImage);
                                    },
                                  ),
                                  const SizedBox(width: 25),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 165,
                                    child: CustomFormField(
                                        controller: _nameC,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        hintText: 'Nama Resep'),
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
                              const SizedBox(height: 16),
                              CustomFormField(
                                  controller: _usageC,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  hintText: 'Aturan Pemakaian'),
                              const SizedBox(height: 16),
                              CustomFormField(
                                  controller: _stepC,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  hintText: 'Cara Pembuatan'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        IngredientInput(
                          onSelected: (value) {},
                          ahead: data,
                        ),
                        const SizedBox(height: 36),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Boxicons.bx_x,
                                color: primary,
                                size: 50,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ref.read(recipeNameProvider.notifier).state =
                                    _nameC.text;
                                ref.read(recipeDescProvider.notifier).state =
                                    _descC.text;
                                ref.read(recipeUsageProvider.notifier).state =
                                    _usageC.text;
                                ref.read(recipeStepProvider.notifier).state =
                                    _stepC.text;
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return const CreateDialog(
                                      type: 'obat',
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Boxicons.bx_check,
                                color: primary,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(
              child: LoadingWidget(),
            ),
            error: (e, s) => const Center(
              child: Text('Error'),
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
