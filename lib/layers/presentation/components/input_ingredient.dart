import 'package:ailment_alleviate/constants/custom_style.dart';
import 'package:ailment_alleviate/routes/router.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientInput extends StatelessWidget {
  const IngredientInput({
    super.key,
    required this.tagsValue,
    required this.onSelected,
    required this.onRemove,
  });
  final List<String> tagsValue;
  final void Function(String) onSelected;
  final void Function(String) onRemove;

  static List<String> items = ['Lorem', 'Ipsum', 'Dolor', 'Sit', 'Amet'];

  @override
  Widget build(BuildContext context) {
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
                  'Bahan yang dipilih akan ditampilkan disini',
                  style: GoogleFonts.lato(
                      textStyle: Typo.paragraph.copyWith(fontSize: 14)),
                )
              : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: tagsValue
                      .map((i) => TagItem(
                            item: i,
                            onRemove: onRemove,
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
            child: TypeAheadField(
              suggestionsCallback: (String query) {
                return items
                    .where((t) => t.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, tag) {
                return ListTile(title: Text(tag));
              },
              noItemsFoundBuilder: (context) {
                return InkWell(
                  onTap: () {
                    router.pushNamed('add-ingredient');
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
                textInputAction: TextInputAction.search,
                onChanged: (value) {},
                // controller: _searchC,
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
            ),
          ),
        ),
      ],
    );
  }
}

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.item,
    required this.onRemove,
  });
  final String item;
  final void Function(String) onRemove;

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
            item,
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
