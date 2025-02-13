import 'package:flutter/material.dart';

abstract class AppPalette {
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const black2 = Color(0xff111011);
  static const black4 = Color(0xff404040);
  static const black23 = Color(0xff121212);

  static const transparent = Colors.transparent;
  static const green = Color(0xFF23AC80);
  static const green2 = Color(0xFF24B086);
  static const green3 = Color(0xFF02D898);
  static const orange1 = Color(0xFFF1B604);
  static const orange2 = Color(0xFFFFCD34);
  // static const lightblue = Color(0xFFF7F8F9);
  static const blue100 = Color.fromRGBO(223, 234, 253, 1);
  static const blue50 = Color(0xFFE0E1E8);
  static const blue150 = Color(0xFFF1F4F9);
  static const blue180 = Color(0xFFE4E8FF);
  static const blue200 = Color(0xFF4C6FFF);
  static const pink = Color(0xFFD04CFF);

  static const blue = Color.fromARGB(255, 41, 11, 177);
  static const lightblue = Color(0xFF1430AB);
  static const errorRed = Color(0xFFE24057);
  static const pink2 = Color(0xFFF46717);
  static const mainBlue = Color(0xFF4C6FFF);
  static const filterColor = Color(0xFFDFEAFD);
  static const headColor = Color(0xFFF1F3FF);
  static const profileColor = Color(0xFFE7EBFC);
  static const profileColor2 = Color(0xFFD0D9FF);
  static const otherColor = Color(0xFF004380);
  static const otherColorLight = Color(0xFFBCC8FC);
  static const grayLight = Color(0xFFB9B9B9);
  static const grayLight2 = Color(0xffcfcfcf);
  static const grayLight3 = Color(0xffE9E9E9);
  static const grayLight4 = Color(0xff2D2D2D);
  static const grayLight5 = Color(0xffF5F7FC);
  static const black3 = Color(0xff000C20);
  static const grayNew = Color(0xffA1A1A1);
  static const grayNew1 = Color(0xff7F7F7F);
  static const orange = Color(0xffF46717);
  static const lightColor = Color(0xffFFEDD5);
  static const purpleColor = Color(0xff910FE1);
  static const purpleColorLight = Color(0xffDBEAFE);
  static const greenLight = Color(0xffFEE2E2);
  static const greenLight2 = Color(0xffEEF2F8);
  static const blueLight2 = Color(0xff0064FF);

  //new

  static Color lightBG = Colors.white;

  static Color darkBG = const Color(0xff121212);
  static Color gray = const Color(0xff9095A6);
  static Color lightgray = const Color(0xFFCCCCD0);

  //new

  // Grey
  static const primary = _PrimaryColor();
  static const grey = _GreyColors();
  static const red = _RedColors();
  static const dark = _DarkColors();
  static const yellow = _YellowColors();
  static const lime = _LimeColors();
}

/// Usage example: `AppPalette.grey.grey50`.
class _GreyColors {
  const _GreyColors();

  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
  final gray50 = const Color(0xffFEFEFE);
  final gray100 = const Color(0xffF9FAFB);
  final gray150 = const Color(0xffE9ECF1);
  final gray160 = const Color(0xffE9EAED);
  final gray170 = const Color(0xfff9f9f9);

  final gray200 = const Color(0xffF8F9FA);
  final gray250 = const Color(0xffefeff0);
  final gray260 = const Color(0xffDBDBDB);
  final gray300 = const Color(0xffC6C7C8);

  final gray340 = const Color(0xffB5B3BB);
  final gray350 = const Color(0xff7A7C7F);
  final gray360 = const Color(0xff6A707F);
  final gray370 = const Color(0xff7c7c7c);

  final gray400 = const Color(0xff959596);

  final grey500 = const Color(0xff7A7C7F);
  final grey550 = const Color(0xff79797C);
  final gray600 = const Color(0xff899197);
  final gray650 = const Color(0xff525252);
  final gray700 = const Color(0xff5B5B5D);
  final gray800 = const Color(0xff373D48);
}

class _PrimaryColor {
  const _PrimaryColor();

  final primary50 = const Color(0xFF007AFF);
  final primary100 = const Color(0xFF2F71EB);

  final primary400 = const Color(0xFF0F57C5);
  final primary350 = const Color(0xEB1150AE);
  final primary300 = const Color(0xFF157705);
  final primary200 = const Color(0xFF0851D9);
}

class _DarkColors {
  const _DarkColors();

  //dark color
  final dark50 = const Color(0xff4D5154);
  final dark55 = const Color(0xff534F4F);
  final dark60 = const Color(0xff3B4250);

  final dark100 = const Color(0xff212529);
  final dark150 = const Color(0xff292929);
  final dark200 = const Color(0xff1A1E21);
  final dark300 = const Color(0xff141619);
  final dark350 = const Color(0xff151A26);

  final dark400 = const Color(0xff000000);
}

class _RedColors {
  const _RedColors();

  final red50 = const Color(0xffEA868F);
  final red60 = const Color(0xffFEEAEA);
  final red100 = const Color(0xffE35D6A);
  final red200 = const Color(0xffDC3545);
  final red300 = const Color(0xffB02A37);
  final red350 = const Color(0xffFF3131);
  final red400 = const Color(0xff842029);
  final red500 = const Color(0xffFF3B30);
}

class _YellowColors {
  const _YellowColors();

  final yellow30 = const Color(0xffFFFEDE);
  final yellow50 = const Color(0xffFFDA6A);
  final yellow100 = const Color(0xffFFCD39);
  final yellow150 = const Color(0xffFFDF00);
  final yellow200 = const Color(0xffFFC107);
  final yellow300 = const Color(0xffCC9A06);

  final yellow400 = const Color(0xff997404);
  final yellow500 = const Color(0xff5F5406);
}

class _LimeColors {
  const _LimeColors();

  final lime50 = const Color(0xffF8FFE6);
  final lime100 = const Color(0xffDEFF8D);
  final lime200 = const Color(0xffD1FF60);
  final lime300 = const Color(0xffC4FF34);
  final lime400 = const Color(0xffAEF207);
}
