import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/custom_style.dart';
import '../../components/form_field.dart';

class AddIngredientScreen extends StatefulWidget {
  const AddIngredientScreen({super.key});

  @override
  State<AddIngredientScreen> createState() => _AddIngredientScreenState();
}

class _AddIngredientScreenState extends State<AddIngredientScreen> {
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
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Boxicons.bx_camera,
                      color: white,
                    ),
                  ),
                ),
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
            Container(
              height: 36,
              width: 150,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Tambah',
                  style: GoogleFonts.lato(
                      textStyle:
                          Typo.paragraph.copyWith(color: white, fontSize: 14)),
                ),
              ),
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
