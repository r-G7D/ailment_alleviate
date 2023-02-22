// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/data/dashboard_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/router.dart';
import '../states/basic_state.dart';

class EmperisScreen extends ConsumerWidget {
  const EmperisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic data = [
      {
        'pic': 'https://picsum.photos/id/1/200/300',
        'title': 'Indigenous Folklore',
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt.',
      },
      {
        'pic': 'https://picsum.photos/id/1/200/300',
        'title': 'Filologi',
        'desc':
            'Filologi adalah studi tentang bahasa dan sastra, serta hubungan antara keduanya. Studi filologi melibatkan analisis bahasa secara historis dan komparatif, dan juga mencakup penelitian mengenai sastra, budaya, sejarah, dan sosial dari bahasa yang dipelajari. Tujuan utama dari studi filologi adalah untuk memahami asal-usul, perkembangan, dan penggunaan bahasa serta karya sastra di dalam budaya dan waktu yang berbeda.',
      },
      {
        'pic': 'https://picsum.photos/id/1/200/300',
        'title': 'Lorem Ipsum',
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt.',
      },
    ];
    // var prov = Provider.of<EmperisProvider>(context, listen: false);
    PageController page = PageController();
    ref.listen(emperisProvider, (previous, next) {
      log('State empiris berubah');
    });
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: MediaQuery.of(context).size.height,
                color: secondary,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                color: white,
                child: PageView(
                  scrollDirection: Axis.vertical,
                  // controller: prov.pageController,
                  controller: page,
                  onPageChanged: (value) {
                    // prov.setActive(value);
                    ref.read(emperisProvider.notifier).state = value;
                  },
                  children: [
                    mainPage(context, data[0], 'dashboard'),
                    mainPage(context, data[1], 'dashboard'),
                    mainPage(context, data[2], 'dashboard'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 112, left: 25),
            child: tabBar(context, ref, page),
          ),
        ],
      ),
    );
  }

  Widget mainPage(BuildContext context, dynamic data, String? route) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 128, bottom: 134),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                data['pic'],
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              data['title'],
              style: GoogleFonts.comfortaa(
                textStyle: Typo.title.copyWith(
                  color: black,
                ),
              ),
            ),
            const SizedBox(height: 11),
            Text(
              data['desc'],
              style: GoogleFonts.lato(
                textStyle: Typo.paragraph.copyWith(
                  color: black,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  router.pushNamed(route!);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primary),
                  minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Text(
                  'Mulai',
                  style: GoogleFonts.comfortaa(
                      textStyle: Typo.paragraph.copyWith(color: white)),
                )),
          ],
        ),
      ),
    );
  }

  Widget tabBar(BuildContext context, WidgetRef ref, PageController page) {
    int currentIndex = ref.watch(emperisProvider);
    return SizedBox(
      height: 300,
      width: 50,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  // prov.setPage(index);
                  ref.read(dashboardRepositoryProvider).fetchRecipes();
                  page.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  elevation: 5,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: currentIndex == index ? primary : white,
                    ),
                    child: Center(
                      child: Text(
                        '0${index + 1}',
                        style: GoogleFonts.comfortaa(
                          textStyle: Typo.title.copyWith(
                            color: currentIndex == index ? white : primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17)
            ],
          );
        },
      ),
    );
  }
}
