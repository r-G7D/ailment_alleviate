// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/presentation/components/net_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/router.dart';
import '../states/basic_state.dart';

class EmperisScreen extends ConsumerWidget {
  const EmperisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var roleP = ref.watch(roleProvider.notifier);
    String filoPath = roleP.state == Role.maker ? 'maker' : 'dashboard';
    dynamic data = [
      {
        'pic': 'https://picsum.photos/id/1/200/300',
        'title': 'Indigenous Folklore',
        'path': null,
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt.',
      },
      {
        'pic': 'https://picsum.photos/id/1/200/300',
        'title': 'Filologi',
        'path': 'dashboard',
        'desc':
            'Filologi adalah studi tentang bahasa dan sastra, serta hubungan antara keduanya. Studi filologi melibatkan analisis bahasa secara historis dan komparatif, dan juga mencakup penelitian mengenai sastra, budaya, sejarah, dan sosial dari bahasa yang dipelajari. Tujuan utama dari studi filologi adalah untuk memahami asal-usul, perkembangan, dan penggunaan bahasa serta karya sastra di dalam budaya dan waktu yang berbeda.',
      },
      {
        'pic': 'https://picsum.photos/id/1/200/300',
        'title': 'Etnomedicine',
        'path': null,
        'desc':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam tincidunt.',
      },
    ];
    // var prov = Provider.of<EmperisProvider>(context, listen: false);
    PageController page = PageController();

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
                    ...data.map((e) => mainPage(context, e)),
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

  Widget mainPage(BuildContext context, dynamic data) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 128, bottom: 134),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => router.pop(),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: NetImage(
                    url: data['pic'],
                    bg: primary!,
                    width: 100,
                    height: 100,
                  )),
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
                  data['path'] == null ? null : router.pushNamed(data['path']);
                },
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(5),
                  backgroundColor: MaterialStateProperty.all(
                      data['path'] == null ? secondary : primary),
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
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // prov.setPage(index);
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
                  child: AnimatedContainer(
                    width: currentIndex == index ? 50 : 50,
                    height: 50,
                    duration: Duration(milliseconds: 250),
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
