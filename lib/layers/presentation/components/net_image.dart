import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/custom_style.dart';

class NetImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color bg;
  const NetImage(
      {super.key,
      required this.url,
      this.width,
      this.height,
      this.fit,
      required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg,
      child: url == null
          ? SizedBox(
              height: height,
              width: width,
              child: Center(
                child: Text(
                  'Gambar tidak ditemukan',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Typo.paragraph.copyWith(
                      fontWeight: FontWeight.w400,
                      color: white,
                      fontSize: width == 50 ? 6 : 10,
                    ),
                  ),
                ),
              ),
            )
          : Image.network(
              url!,
              width: width,
              height: height,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : bg == primary
                          ? const ImageLoadingWidget()
                          : const LoadingWidget(),
              errorBuilder: (context, error, stackTrace) => SizedBox(
                height: height,
                width: width,
                child: Center(
                  child: Text(
                    'Gambar tidak ditemukan',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: Typo.paragraph.copyWith(
                        fontWeight: FontWeight.w400,
                        color: white,
                        fontSize: width == 50 ? 6 : 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
