// ignore_for_file: prefer_const_constructors

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/emperis_provider.dart';

class EmperisScreen extends StatelessWidget {
  const EmperisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = [
      {
        'pic': 'https://picsum.photos/id/1/200/300',
        'title': 'Indigenous Folklore',
        'desc':
            'Filologi adalah studi tentang bahasa dan sastra, serta hubungan antara keduanya. Studi filologi melibatkan analisis bahasa secara historis dan komparatif, dan juga mencakup penelitian mengenai sastra, budaya, sejarah, dan sosial dari bahasa yang dipelajari. Tujuan utama dari studi filologi adalah untuk memahami asal-usul, perkembangan, dan penggunaan bahasa serta karya sastra di dalam budaya dan waktu yang berbeda.',
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
            'Filologi adalah studi tentang bahasa dan sastra, serta hubungan antara keduanya. Studi filologi melibatkan analisis bahasa secara historis dan komparatif, dan juga mencakup penelitian mengenai sastra, budaya, sejarah, dan sosial dari bahasa yang dipelajari. Tujuan utama dari studi filologi adalah untuk memahami asal-usul, perkembangan, dan penggunaan bahasa serta karya sastra di dalam budaya dan waktu yang berbeda.',
      },
    ];
    var prov = Provider.of<EmperisProvider>(context, listen: false);
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
                  controller: prov.pageController,
                  onPageChanged: (value) {
                    prov.setActive(value);
                  },
                  children: [
                    mainPage(context, data[0]),
                    mainPage(context, data[1]),
                    mainPage(context, data[2]),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 112, left: 25),
            child: tabBar(context),
          ),
        ],
      ),
    );
  }

  Widget mainPage(BuildContext context, dynamic data) {
    return Column(
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
        ElevatedButton(
            onPressed: () {},
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
    );
  }

  Widget tabBar(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 50,
      child: Consumer<EmperisProvider>(
        builder: (_, prov, __) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      prov.setPage(index);
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
                          color: prov.active == index ? primary : white,
                        ),
                        child: Center(
                          child: Text(
                            '0${index + 1}',
                            style: GoogleFonts.comfortaa(
                              textStyle: Typo.title.copyWith(
                                color: prov.active == index ? white : primary,
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
          );
        },
      ),
    );
  }
}
