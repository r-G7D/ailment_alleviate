import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Color? primary = const Color(0xFF6246EA);
Color? secondary = const Color(0xFFD1D1E9);
Color? red = const Color(0xffE53935);
Color? yellow = const Color(0xffFFC400);
Color? green = const Color(0xff4BB450);
Color? light = const Color(0xFFDAE4FF);
Color? black = const Color(0xFF2B2C34);
Color? white = const Color(0xFFFFFFFE);
Color? offWhite = const Color(0xFFEDEDED);
Color? grey = const Color(0xFFD9D9D9);

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primary,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class Typo {
  static final title = TextStyle(
    fontWeight: FontWeight.w700,
    color: black,
    fontSize: 24,
  );

  static final paragraph = TextStyle(
    fontWeight: FontWeight.w300,
    color: black,
    fontSize: 10,
  );
}

class Decor {
  static BoxShadow boxShadow = const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      blurRadius: 12,
      spreadRadius: 0,
      offset: Offset(1, 4));
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        duration: const Duration(milliseconds: 1550),
        itemBuilder: (context, index) => DecoratedBox(
          decoration: BoxDecoration(
            color: primary,
          ),
        ),
        size: 40,
      ),
    );
  }
}

class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        duration: const Duration(milliseconds: 1550),
        itemBuilder: (context, index) => DecoratedBox(
          decoration: BoxDecoration(
            color: white,
          ),
        ),
        size: 20,
      ),
    );
  }
}
