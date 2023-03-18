import 'dart:async';

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/router.dart';
import '../../components/net_image.dart';
import '../../states/basic_state.dart';

class MakerScreen extends StatelessWidget {
  const MakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = {
      "pending": [
        {
          "id": 35,
          "nama_obat": "tester 1",
          "keterangan": "ket 1",
          "gambar":
              "https://deployailment.pythonanywhere.com/media/obat/dumm_ItsSQfL.png",
          "cara_pembuatan": "cp 1",
          "aturan_pemakaian": "ap 1",
          "bahan": [
            {
              "id": 29,
              "nama_bahan": "Akar Anting-Anting Kering",
              "gambar":
                  "https://deployailment.pythonanywhere.com/media/bahan/_0030_akar_anting-anting.jpg",
              "keterangan": "_"
            },
            {
              "id": 30,
              "nama_bahan": "Batang Seledri",
              "gambar":
                  "https://deployailment.pythonanywhere.com/media/bahan/_0037_Daun_dan_Batang_Seledri_Muda.jpg",
              "keterangan": "_"
            }
          ]
        },
        {
          "id": 38,
          "nama_obat": "tester 3",
          "keterangan": "ket 3",
          "gambar":
              "https://deployailment.pythonanywhere.com/media/obat/default.jpeg",
          "cara_pembuatan": "cp 3",
          "aturan_pemakaian": "ap 3",
          "bahan": [
            {
              "id": 29,
              "nama_bahan": "Akar Anting-Anting Kering",
              "gambar":
                  "https://deployailment.pythonanywhere.com/media/bahan/_0030_akar_anting-anting.jpg",
              "keterangan": "_"
            },
            {
              "id": 30,
              "nama_bahan": "Batang Seledri",
              "gambar":
                  "https://deployailment.pythonanywhere.com/media/bahan/_0037_Daun_dan_Batang_Seledri_Muda.jpg",
              "keterangan": "_"
            }
          ]
        }
      ],
      "accepted": [
        {
          "id": 36,
          "nama_obat": "tester 2",
          "keterangan": "ket 2",
          "gambar":
              "https://deployailment.pythonanywhere.com/media/obat/dumm_tyESUGj.png",
          "cara_pembuatan": "cp 1",
          "aturan_pemakaian": "ap 1",
          "bahan": [
            {
              "id": 29,
              "nama_bahan": "Akar Anting-Anting Kering",
              "gambar":
                  "https://deployailment.pythonanywhere.com/media/bahan/_0030_akar_anting-anting.jpg",
              "keterangan": "_"
            },
            {
              "id": 30,
              "nama_bahan": "Batang Seledri",
              "gambar":
                  "https://deployailment.pythonanywhere.com/media/bahan/_0037_Daun_dan_Batang_Seledri_Muda.jpg",
              "keterangan": "_"
            }
          ]
        }
      ]
    };

    String accountStatus = '';

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: Text(
          'Ailment Alleviate',
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
      floatingActionButton:
          accountStatus == 'pending' || accountStatus == 'declined'
              ? const SizedBox()
              : SizedBox(
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
      body: accountStatus == 'pending' || accountStatus == 'declined'
          ? accountPending(context, accountStatus: accountStatus)
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 34),
              child: Column(
                children: [
                  accountCard(),
                  const SizedBox(height: 16),
                  MedList(isAccepted: true, data: data['accepted']),
                  const SizedBox(height: 16),
                  MedList(isAccepted: false, data: data['pending']),
                ],
              ),
            ),
    );
  }

  Widget accountCard() {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey!.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle,
                size: 50,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama',
                    style: GoogleFonts.comfortaa(
                        textStyle:
                            Typo.title.copyWith(color: black, fontSize: 16)),
                  ),
                  Text(
                    'Email',
                    style: GoogleFonts.lato(
                        textStyle: Typo.paragraph
                            .copyWith(color: black, fontSize: 14)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget accountPending(BuildContext context, {required String accountStatus}) {
    return Container(
      height: MediaQuery.of(context).size.height - 70,
      color: white,
      child: Column(
        children: [
          statusCard(accountStatus == 'pending' ? true : false),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 26),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  router.pop();
                },
                child: Text(
                  'Keluar',
                  style: GoogleFonts.comfortaa(
                      textStyle:
                          Typo.title.copyWith(color: white, fontSize: 18)),
                )),
          ),
        ],
      ),
    );
  }

  Widget statusCard(bool pending) {
    return Padding(
      padding: const EdgeInsets.all(17.5),
      child: Card(
        elevation: 2,
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 17),
          height: pending ? 100 : 115,
          decoration: BoxDecoration(
            color: pending ? yellow!.withOpacity(0.1) : red!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pending ? 'Sedang diverifikasi' : 'Pengajuan ditolak!',
                    style: GoogleFonts.lato(
                        textStyle: Typo.title.copyWith(
                      color: pending ? yellow : red,
                      fontSize: 16,
                    )),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 265,
                    child: Text(
                      pending
                          ? 'Akun anda sedang diverifikasi oleh admin, silahkan tunggu dalam beberapa hari.'
                          : 'Akun anda ditolak oleh admin, mohon perbarui berkas anda atau hubungi admin untuk informasi lebih lanjut.',
                      style: GoogleFonts.lato(
                          textStyle: Typo.paragraph.copyWith(
                              color: pending ? yellow : red,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Icon(
                Icons.warning,
                color: pending ? yellow : red,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MedList extends ConsumerWidget {
  final bool isAccepted;
  final dynamic data;
  const MedList({super.key, required this.isAccepted, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov =
        isAccepted ? ref.watch(acceptedProvider) : ref.watch(pendingProvider);

    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: isAccepted ? secondary : offWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                isAccepted
                    ? ref.read(acceptedProvider.notifier).state = !prov
                    : ref.read(pendingProvider.notifier).state = !prov;
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: isAccepted ? primary : primaryLight,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isAccepted ? 'Diterima' : 'Menunggu',
                      style: GoogleFonts.lato(
                        textStyle: Typo.paragraph.copyWith(
                          color: isAccepted ? white : primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      isAccepted ? '${data.length}' : '${data.length}',
                      style: GoogleFonts.lato(
                        textStyle: Typo.paragraph.copyWith(
                          color: isAccepted ? white : primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              // height:
              //     prov ? 56.0 * (isAccepted ? data.length : data.length) : 0,
              curve: Curves.easeInOut,
              height: prov ? 130 : 0,
              padding: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                color: isAccepted ? secondary : offWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              duration: const Duration(milliseconds: 200),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: isAccepted ? data.length : data.length,
                itemBuilder: (context, index) {
                  return medTile(ref, isAccepted, data[index]['nama_obat'],
                      data[index]['id'], data[index]['gambar']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget medTile(
      WidgetRef ref, bool accepted, String name, int id, String pic) {
    var prov =
        isAccepted ? ref.watch(acceptedProvider) : ref.watch(pendingProvider);

    return Row(
      children: [
        InkWell(
          onTap: () {
            router.pushNamed('recipe');
            ref.watch(idProvider.notifier).state = id;
          },
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            height: prov ? 112 : 0,
            width: 86,
            padding: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: NetImage(
                    url: pic,
                    bg: white!,
                    height: 62,
                    width: 86,
                  ),
                ),
                Container(
                  height: 42,
                  width: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Center(
                    child: AutoSizeText(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        textStyle: Typo.paragraph.copyWith(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
    // return ListTile(
    //   onTap: () {
    //     router.pushNamed('recipe');
    //     ref.watch(idProvider.notifier).state = id;
    //   },
    //   title: Text(
    //     name,
    //     style: GoogleFonts.lato(
    //       textStyle: Typo.paragraph.copyWith(
    //         color: black,
    //         fontSize: 16,
    //         fontWeight: FontWeight.w400,
    //       ),
    //     ),
    //   ),
    //   trailing: const Icon(
    //     Icons.chevron_right,
    //   ),
    // );
  }
}
