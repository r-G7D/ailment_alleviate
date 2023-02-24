// import 'package:ailment_alleviate/layers/data/dashboard_provider.dart';
import 'dart:developer';

import 'package:ailment_alleviate/layers/domain/filter/filter.dart';
import 'package:ailment_alleviate/layers/domain/ingredient/ingredient.dart';
import 'package:ailment_alleviate/layers/presentation/states/basic_state.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/custom_style.dart';
import '../../data/dashboard_repo.dart';
import '../../domain/recipe/recipe.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(filterProvider, (previous, next) {
    //   log('State filter berubah');
    // });
    AsyncValue<List<Recipe>> searchP = ref.watch(searchProvider);
    TextEditingController searchC = TextEditingController(
      text: ref.watch(queryProvider),
    );

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
                            controller: searchC,
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
                      InkWell(
                        onTap: () {
                          ref.read(queryProvider.notifier).state = searchC.text;
                        },
                        child: Icon(
                          Icons.search,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 25),
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
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
            // SizedBox(
            //   height: MediaQuery.of(context).size.height - 153,
            //   child: FutureBuilder(
            //       future: ref
            //           .read(dashboardRepositoryProvider)
            //           .fetchRecipes(ref.watch(queryProvider)),
            //       builder: (context, snapshot) {
            //         if (snapshot.hasData) {
            //           dynamic data = snapshot.data;
            //           log(data.toString());
            //           if (data.length == 0) {
            //             return Center(
            //               child: Text(
            //                 'Tidak ada hasil',
            //                 style: GoogleFonts.lato(
            //                   textStyle: Typo.title,
            //                 ),
            //               ),
            //             );
            //           } else {
            //             return SingleChildScrollView(
            //               child: Wrap(
            //                 spacing: 10,
            //                 children: [
            //                   ...data
            //                       .map((e) => Column(
            //                             children: [
            //                               searchItem(e.name, e.ingredients),
            //                               const SizedBox(height: 10),
            //                             ],
            //                           ))
            //                       .toList(),
            //                 ],
            //               ),
            //             );
            //           }
            //         } else if (snapshot.connectionState ==
            //             ConnectionState.waiting) {
            //           return const LoadingWidget();
            //         } else {
            //           return Center(
            //             child: Text(
            //               'Tidak ada hasil',
            //               style: GoogleFonts.lato(
            //                 textStyle: Typo.title,
            //               ),
            //             ),
            //           );
            //         }
            //       }),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 153,
              child: searchP.when(data: (data) {
                return SingleChildScrollView(
                  child: data.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height - 153,
                          child: Center(
                            child: Text(
                              'Tidak ada hasil',
                              style: GoogleFonts.lato(
                                textStyle: Typo.title,
                              ),
                            ),
                          ),
                        )
                      : Wrap(
                          spacing: 10,
                          children: [
                            ...data
                                .map((e) => Column(
                                      children: [
                                        //* e = Recipe
                                        searchItem(e.id.toString(), e.name!,
                                            e.pic!, e.ingredients),
                                        const SizedBox(height: 10),
                                      ],
                                    ))
                                .toList(),
                          ],
                        ),
                );
              }, error: ((error, stackTrace) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 153,
                  child: Center(
                    child: Text(
                      error.toString(),
                    ),
                  ),
                );
              }), loading: () {
                return const LoadingWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchItem(
      String id, String name, String img, List<Ingredient> ingredients) {
    List<String> ingredientsName = [];
    for (var element in ingredients) {
      //* element = Ingredient
      ingredientsName.add(element.name);
    }

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
            child: Image.network(
              img,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null ? child : const ImageLoadingWidget(),
              errorBuilder: (context, error, stackTrace) => Container(
                height: 100,
                width: 151,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Gambar tidak ditemukan',
                    style: GoogleFonts.lato(
                      textStyle: Typo.paragraph
                          .copyWith(fontWeight: FontWeight.w400, color: white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FittedBox(
                  // width: 121,
                  // height: 14,
                  child: Text(
                    name,
                    style: GoogleFonts.lato(
                      textStyle: Typo.paragraph.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // width: 121,
                  // height: 12,
                  child: Text(
                    ingredientsName
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                    maxLines: 2,
                    style: GoogleFonts.lato(
                      textStyle: Typo.paragraph.copyWith(fontSize: 8),
                    ),
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
                          ref.read(filterStateProvider.notifier).clearFilter();
                          ref.read(filterProvider.notifier).state = '';
                          log(ref.watch(filterStateProvider).toString());
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
                  ref.watch(ingredientProvider).when(
                    data: (data) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 312,
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              for (var i = 0; i < data.length; i++)
                                filterItem(data[i].name, ref),
                            ],
                          ),
                        ),
                      );
                    },
                    error: ((error, stackTrace) {
                      return Center(
                        child: Text(
                          error.toString(),
                        ),
                      );
                    }),
                    loading: () {
                      return const LoadingWidget();
                    },
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(filterProvider.notifier).state = ref
                          .watch(filterStateProvider)
                          .filters
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .replaceAll(',', '');
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
    Filter filter = ref.watch(filterStateProvider);

    return InkWell(
      onTap: () {
        // prov.filters.contains(nama)
        //     ? prov.removeFilter(nama)
        //     : prov.addFilter(nama);
        filter.filters.contains(nama)
            ? ref.read(filterStateProvider.notifier).removeFilter(nama)
            : ref.read(filterStateProvider.notifier).addFilter(nama);
        log(ref.watch(filterStateProvider).toString());
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
