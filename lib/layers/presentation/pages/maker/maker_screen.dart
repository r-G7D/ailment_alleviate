import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/data/maker_repository/maker_repository.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/router.dart';
import '../../../domain/recipe/recipe.dart';
import '../../components/net_image.dart';
import '../../states/basic_state.dart';
import 'controller/maker_controller.dart';

class MakerScreen extends ConsumerWidget {
  const MakerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(makerProvider).when(
      data: (data) {
        String accountStatus = data.accountStatus;
        List<Recipe> pending = data.pending!;
        List<Recipe> accepted = data.accepted!;

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
              accountStatus == 'MENUNGGU' || accountStatus == 'DITOLAK'
                  ? const SizedBox()
                  : SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                        backgroundColor: primary,
                        onPressed: () {
                          router.pushNamed('create-recipe');
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
          body: accountStatus == 'MENUNGGU' || accountStatus == 'DITOLAK'
              ? accountPending(context, accountStatus: accountStatus)
              : RefreshIndicator(
                  color: primary,
                  onRefresh: () async {
                    ref.watch(makerRepositoryProvider).fetchMaker();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 26, horizontal: 34),
                    child: ListView(
                      children: [
                        accountCard(data.profile!['nama']!,
                            data.profile!['email']!, ref),
                        const SizedBox(height: 16),
                        MedList(status: 'accepted', data: accepted),
                        const SizedBox(height: 16),
                        MedList(status: 'pending', data: pending),
                      ],
                    ),
                  ),
                ),
        );
      },
      error: (error, trace) {
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
          body: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
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
          body: const Center(
            child: LoadingWidget(),
          ),
        );
      },
    );
  }

  Widget accountCard(String name, String email, WidgetRef ref) {
    return Container(
      height: 70 + 60,
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
            offset: const Offset(0, 3),
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
                    name,
                    style: GoogleFonts.comfortaa(
                        textStyle:
                            Typo.title.copyWith(color: black, fontSize: 16)),
                  ),
                  Text(
                    email,
                    style: GoogleFonts.lato(
                        textStyle: Typo.paragraph
                            .copyWith(color: black, fontSize: 14)),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                ref.read(makerControllerProvider.notifier).logout();
              },
              child: Text('Logout'))
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
          statusCard(accountStatus == 'MENUNGGU' ? true : false),
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
  final String status;
  final dynamic data;
  const MedList({super.key, required this.status, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov = status == 'accepted'
        ? ref.watch(acceptedProvider)
        : status == 'pending'
            ? ref.watch(pendingProvider)
            : ref.watch(declinedProvider);

    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: status == 'accepted'
              ? secondary
              : status == 'pending'
                  ? offWhite
                  : red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                status == 'accepted'
                    ? ref.read(acceptedProvider.notifier).state = !prov
                    : status == 'pending'
                        ? ref.read(pendingProvider.notifier).state = !prov
                        : ref.read(declinedProvider.notifier).state = !prov;
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: status == 'accepted'
                      ? primary
                      : status == 'pending'
                          ? primaryLight
                          : red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status == 'accepted'
                          ? 'Diterima'
                          : status == 'pending'
                              ? 'Menunggu'
                              : 'Ditolak',
                      style: GoogleFonts.lato(
                        textStyle: Typo.paragraph.copyWith(
                          color: status == 'accepted'
                              ? white
                              : status == 'pending'
                                  ? primary
                                  : red,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      data.length.toString(),
                      style: GoogleFonts.lato(
                        textStyle: Typo.paragraph.copyWith(
                          color: status == 'accepted'
                              ? white
                              : status == 'pending'
                                  ? primary
                                  : red,
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
                color: status == 'accepted'
                    ? secondary
                    : status == 'pending'
                        ? offWhite
                        : red,
                borderRadius: BorderRadius.circular(5),
              ),
              duration: const Duration(milliseconds: 200),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return medTile(ref, status, data[index].name, data[index].id,
                      data[index].pic);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget medTile(
      WidgetRef ref, String status, String name, int id, String pic) {
    var prov = status == 'accepted'
        ? ref.watch(acceptedProvider)
        : status == 'pending'
            ? ref.watch(pendingProvider)
            : ref.watch(declinedProvider);

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
