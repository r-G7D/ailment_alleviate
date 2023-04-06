// import 'dart:developer';

import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/layers/domain/ingredient/ingredient.dart';
import 'package:ailment_alleviate/layers/presentation/states/basic_state.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientInput extends ConsumerWidget {
  final void Function(dynamic) onSelected;
  final List<Ingredient> ahead;
  const IngredientInput({
    super.key,
    required this.onSelected,
    required this.ahead,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Ingredient> tagsValue = ref.watch(addIngsProvider).ingredients;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: offWhite,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: tagsValue.isEmpty
              ? Text(
                  'Bahan yang sudah dipilih akan ditampilkan disini.',
                  style: GoogleFonts.lato(
                      textStyle: Typo.paragraph.copyWith(fontSize: 14)),
                )
              : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: tagsValue
                      .map((i) => TagItem(
                            item: i,
                            onRemove: (value) {
                              ref
                                  .read(addIngsProvider.notifier)
                                  .removeIngredient(value);
                              // log(ref.watch(addIngsProvider).toString());
                            },
                          ))
                      .toList(),
                ),
        ),
        const SizedBox(height: 16),
        Center(
            child: Container(
          height: 50,
          width: 250,
          padding: const EdgeInsets.only(left: 18, bottom: 8, top: 8),
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: typeAhead(ref, ahead),
        )
            // child: ref.watch(ingredientProvider).when(
            //       data: (data) {
            // return Container(
            //     height: 50,
            //     width: 250,
            //     padding:
            //         const EdgeInsets.only(left: 18, bottom: 8, top: 8),
            //     decoration: BoxDecoration(
            //       color: secondary,
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(25),
            //       ),
            //     ),
            //     child: typeAhead(ref, data));
            //       },
            //       loading: () => const Center(
            //         child: LoadingWidget(),
            //       ),
            //       error: (e, s) => const Center(
            //         child: Text('Error'),
            //       ),
            //     ),
            ),
      ],
    );
  }

  Widget typeAhead(WidgetRef ref, List<Ingredient> data) {
    // List<String> items = data.map((e) => e.name.toString()).toList();

    return TypeAheadField<Ingredient>(
      suggestionsCallback: (String query) {
        return data
            .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      itemBuilder: (context, tag) {
        return ListTile(
          title: Text(tag.name),
          onTap: () {
            ref.watch(addIngsProvider).ingredients.contains(tag)
                ? null
                : {
                    ref.read(addIngsProvider.notifier).addIngredient(tag),
                    // log(ref.watch(addIngsProvider).toString())
                  };
          },
        );
      },
      noItemsFoundBuilder: (context) {
        return InkWell(
          onTap: () {
            router.pushNamed('create-ingredient');
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tambah bahan',
                  style: GoogleFonts.lato(
                      textStyle: Typo.paragraph.copyWith(fontSize: 16)),
                ),
                Icon(
                  Boxicons.bx_plus,
                  color: primary,
                  size: 24,
                )
              ],
            ),
          ),
        );
      },
      onSuggestionSelected: onSelected,
      textFieldConfiguration: TextFieldConfiguration(
        textInputAction: TextInputAction.done,
        cursorColor: primary,
        maxLines: 1,
        style: GoogleFonts.lato(
          textStyle: Typo.paragraph.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: primary,
          ),
          border: InputBorder.none,
          hintText: 'Cari bahan',
          hintStyle: GoogleFonts.lato(
            textStyle: Typo.paragraph.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.item,
    required this.onRemove,
  });
  final Ingredient item;
  final void Function(Ingredient) onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.name,
            style: GoogleFonts.lato(
                textStyle: Typo.paragraph.copyWith(color: white, fontSize: 14)),
          ),
          GestureDetector(
            onTap: () => onRemove(item),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.close,
                size: 16,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
