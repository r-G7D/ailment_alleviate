// import 'package:ailment_alleviate/layers/data/dashboard_provider.dart';
import 'dart:developer';

import 'package:ailment_alleviate/layers/domain/filter/filter.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/custom_style.dart';
import '../presentation/states/dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(filterProvider, (previous, next) {
      log('State filter berubah');
    });
    return Scaffold(
      backgroundColor: white,
      endDrawer: filterDrawer(context, ref),
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 35, right: 35),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 43,
                  width: 250,
                  padding: const EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: SizedBox(
                          width: 190,
                          child: TextField(
                            cursorColor: primary,
                            maxLines: 1,
                            style: GoogleFonts.lato(
                                textStyle: Typo.paragraph.copyWith(
                              fontWeight: FontWeight.w400,
                            )),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Cari gejala',
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: Typo.paragraph.copyWith(
                                fontWeight: FontWeight.w400,
                              )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.search,
                        color: white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 25),
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                      // showModalBottomSheet(
                      //   // isDismissible: false,
                      //   context: context,
                      //   builder: (context) {
                      //     return Container();
                      //   },
                      // );
                    },
                    child: Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: white,
                      ),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height - 153,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  children: [
                    for (var i = 0; i < 10; i++)
                      Column(
                        children: [
                          searchItem(),
                          const SizedBox(height: 10),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchItem() {
    return Container(
      height: 143,
      width: 151,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 151,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama obat',
                  style: GoogleFonts.lato(
                    textStyle: Typo.paragraph.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  'Bahan 1',
                  style: GoogleFonts.lato(
                    textStyle: Typo.paragraph.copyWith(fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget filterDrawer(BuildContext context, WidgetRef ref) {
    // var prov = Provider.of<DashboardProvider>(context);
    return SafeArea(
      child: Row(
        children: [
          Container(
            color: black!.withOpacity(0.01),
            width: 50,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: white,
            width: MediaQuery.of(context).size.width - 50,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 78, left: 42, bottom: 45, right: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Filter Bahan',
                        style: GoogleFonts.comfortaa(
                            textStyle: Typo.paragraph.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )),
                      ),
                      InkWell(
                        onTap: () {
                          // prov.clearFilter();
                          ref.read(filterProvider.notifier).clearFilter();
                          // ref.read(filterProvider.notifier).state = [];
                          log(ref.watch(filterProvider).toString());
                        },
                        child: Text(
                          'Reset',
                          style: GoogleFonts.comfortaa(
                              textStyle: Typo.paragraph.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: primary)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (var i = 0; i < 10; i++)
                          filterItem('Bahan $i', ref),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      router.pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primary),
                      minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 43)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      'Terapkan',
                      style: GoogleFonts.comfortaa(
                          textStyle: Typo.paragraph.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterItem(String nama, WidgetRef ref) {
    Filter filter = ref.watch(filterProvider);

    return InkWell(
      onTap: () {
        // prov.filters.contains(nama)
        //     ? prov.removeFilter(nama)
        //     : prov.addFilter(nama);
        filter.filters.contains(nama)
            ? ref.read(filterProvider.notifier).removeFilter(nama)
            : ref.read(filterProvider.notifier).addFilter(nama);
        log(ref.watch(filterProvider).toString());
      },
      child: Container(
        height: 41,
        width: 128,
        decoration: BoxDecoration(
          color: filter.filters.contains(nama) ? primary : secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            nama,
            style: GoogleFonts.lato(
              textStyle: Typo.paragraph.copyWith(
                fontWeight: FontWeight.w400,
                color: filter.filters.contains(nama) ? white : black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget botsheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
    );
  }
}
