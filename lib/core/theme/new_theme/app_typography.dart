// An example of an alternative way to group text styles
// can be found in the `lib/app_palette.dart` file.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  static final body1 = GoogleFonts.dmSans( fontWeight: FontWeight.normal);
  

  static const h1 = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
  );
}