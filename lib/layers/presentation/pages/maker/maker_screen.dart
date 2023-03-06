import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/router.dart';

class MakerScreen extends StatelessWidget {
  const MakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Alleviate',
          style: GoogleFonts.comfortaa(
              textStyle: Typo.title.copyWith(color: white)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Boxicons.bx_log_out,
              color: white,
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FloatingActionButton(
          backgroundColor: primary,
          onPressed: () {
            router.pushNamed('add-med');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 14,
          ),
        ),
      ),
      body: const Center(
        child: Text('Maker'),
      ),
    );
  }
}
