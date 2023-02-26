import 'dart:developer';

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/presentation/components/net_image.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/dashboard_repo.dart';
import '../../domain/ingredient/ingredient.dart';
import '../../domain/recipe/recipe.dart';
import '../states/basic_state.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Recipe> recipe = ref.watch(recipeProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            recipe.when(data: (data) {
              return recipeExist(context, ref, data);
            }, loading: () {
              return const LoadingWidget();
            }, error: (error, stack) {
              return ErrorWidget(error);
            }),
          ],
        ),
      ),
    );
  }

  Widget recipeExist(BuildContext context, WidgetRef ref, Recipe recipe) {
    return Column(
      children: [
        Container(
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => router.pop(),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: NetImage(
                        url: recipe.pic!,
                        bg: primary!,
                        width: 100,
                        height: 100,
                      )),
                ),
                const SizedBox(height: 26),
                Text(
                  recipe.name!,
                  style: GoogleFonts.comfortaa(
                    textStyle: Typo.title.copyWith(
                      color: black,
                    ),
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  recipe.desc!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Typo.paragraph.copyWith(
                      color: black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )),
        Container(
          height: MediaQuery.of(context).size.height - 350,
          color: white,
          child: Column(
            children: [
              tabView(context, ref),
              Container(
                height: MediaQuery.of(context).size.height - 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(
                      color: primary!,
                      width: 2,
                    ),
                    left: BorderSide(
                      color: primary!,
                      width: 2,
                    ),
                    right: BorderSide(
                      color: primary!,
                      width: 2,
                    ),
                  ),
                ),
                child: PageView(
                  controller: ref.watch(recipePage),
                  onPageChanged: (value) =>
                      ref.read(emperisProvider.notifier).state = value,
                  children: [
                    ingredientPage(context, recipe.ingredients),
                    stepPage(context, recipe.steps),
                    usagePage(context, recipe.usage)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget ingredientPage(BuildContext context, List<Ingredient> ingredient) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height - 420,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          // color: light!.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...ingredient
                .map(
                  (e) => SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: NetImage(
                                bg: primary!,
                                url: e.pic,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    e.name,
                                    style: GoogleFonts.lato(
                                      textStyle: Typo.paragraph.copyWith(
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(height: 9),
                                  Text(
                                    e.desc,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      textStyle: Typo.paragraph.copyWith(
                                        color: black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget stepPage(BuildContext context, String steps) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height - 440,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: light!.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              steps,
              style: GoogleFonts.lato(
                textStyle: Typo.paragraph.copyWith(
                  color: black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget usagePage(BuildContext context, String usage) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height - 440,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: light!.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              usage,
              style: GoogleFonts.lato(
                textStyle: Typo.paragraph.copyWith(
                  color: black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabView(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(emperisProvider);
    dynamic items = {
      'title': [
        'Bahan',
        'Cara Pembuatan',
        'Aturan Pemakaian',
      ],
      'icon': [
        Boxicons.bxs_shopping_bag,
        Boxicons.bx_help_circle,
        Icons.balance
      ],
    };
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Builder(builder: (context) {
            int wi = currentIndex == i ? 50 : -25;
            return InkWell(
              onTap: () => ref.read(recipePage).animateToPage(i,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut),
              child: Material(
                elevation: currentIndex == i ? 5 : 0,
                child: AnimatedContainer(
                  height: 50,
                  width: (MediaQuery.of(context).size.width / 3) + wi,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: primary!,
                        width: currentIndex == i ? 2 : 0,
                      ),
                      left: BorderSide(
                        color: primary!,
                        width: currentIndex == i ? 2 : 0,
                      ),
                      right: BorderSide(
                        color: primary!,
                        width: currentIndex == i ? 2 : 0,
                      ),
                      bottom: BorderSide(
                        color: currentIndex != i ? primary! : white!,
                        width: currentIndex != i ? 2 : 0,
                      ),
                    ),
                    color: currentIndex == i ? white : white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        items['icon'][i],
                        color: currentIndex == i ? primary : secondary,
                        size: currentIndex == i ? 24 : 20,
                      ),
                      currentIndex == i
                          ? Row(
                              children: [
                                const SizedBox(width: 4),
                                Text(
                                  items['title'][i],
                                  style: GoogleFonts.lato(
                                    textStyle: Typo.paragraph.copyWith(
                                        color: currentIndex == i
                                            ? black
                                            : secondary,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            );
          })
      ],
    );
  }
}

// Widget tabView(BuildContext context, WidgetRef ref) {
//     int currentIndex = ref.watch(emperisProvider);
//     List items = [
//       'Bahan',
//       'Cara',
//       'Dosis',
//     ];
//     List<Color> colors = [
//       primary!.withOpacity(0.5),
//       primary!.withOpacity(0.25),
//       primary!.withOpacity(0.125),
//     ];
//     return Column(
//       children: [
//         Row(
//           children: [
//             for (int i = 0; i < items.length; i++)
//               Builder(builder: (context) {
//                 int wi = currentIndex == i ? 50 : -25;
//                 return InkWell(
//                   onTap: () => ref.read(emperisProvider.notifier).state = i,
//                   child: Material(
//                     elevation: currentIndex == i ? 5 : 5,
//                     child: AnimatedContainer(
//                       height: 50,
//                       width: (MediaQuery.of(context).size.width / 3) + wi,
//                       duration: const Duration(milliseconds: 300),
//                       decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(8),
//                             topRight: Radius.circular(8),
//                           ),
//                           // color: currentIndex == i ? primary : white,
//                           color: colors[i]),
//                       child: Center(
//                         child: Text(
//                           items[i],
//                           style: GoogleFonts.lato(
//                             textStyle: Typo.paragraph.copyWith(
//                               color: currentIndex == i ? white : black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               })
//           ],
//         ),
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           height: MediaQuery.of(context).size.height - 400,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: white,
//             border: Border.all(
//                 color: currentIndex == 0
//                     ? colors.first
//                     : currentIndex == 1
//                         ? colors[1]
//                         : colors[2],
//                 width: 5),
//           ),
//         )
//       ],
//     );
//   }
