import 'dart:developer';

import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../constants/custom_style.dart';
import '../../../../../../routes/router.dart';
import '../../controller/maker_controller.dart';

class CreateDialog extends ConsumerWidget {
  final String type;
  const CreateDialog({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov =
        type == 'bahan' ? createIngredientProvider : createRecipeProvider;
    return Dialog(
      child: SizedBox(
        height: 300,
        child: ref.watch(prov).when(
          data: (data) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  child: const Center(
                    child: Icon(
                      Boxicons.bx_check,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Berhasil menambahkan $type',
                  style: GoogleFonts.lato(
                      textStyle: Typo.paragraph
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 36),
                Container(
                  height: 36,
                  width: 100,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primary!),
                  ),
                  child: TextButton(
                    onPressed: () {
                      router.pop();
                      router.pop();
                    },
                    child: Text(
                      'Tutup',
                      style: GoogleFonts.lato(
                          textStyle: Typo.paragraph.copyWith(
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stack) {
            log(error.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  child: const Center(
                    child: Icon(
                      Boxicons.bx_x,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Gagal menambahkan $type',
                  style: GoogleFonts.lato(
                      textStyle: Typo.paragraph
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 36),
                Container(
                  height: 36,
                  width: 100,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primary!),
                  ),
                  child: TextButton(
                    onPressed: () {
                      router.pop();
                    },
                    child: Text(
                      'Tutup',
                      style: GoogleFonts.lato(
                          textStyle: Typo.paragraph.copyWith(
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () {
            return const Center(
              child: LoadingWidget(),
            );
          },
        ),
      ),
    );
  }
}
