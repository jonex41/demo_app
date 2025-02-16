import 'dart:io';

import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

String formatMoney(String value) {
  final oCcy = NumberFormat("#,##0.00", "en_US");
  return oCcy.format(double.parse(value));
}

String currencyNaire(BuildContext context) {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  return format.currencySymbol;
}

Widget NaireText(BuildContext context,
    {Color? textColor, double? size, FontWeight? weight, String prefix = ""}) {
  return Text("$prefix${currencyNaire(context)}",
      style: GoogleFonts.alatsi(
          fontWeight: weight ?? FontWeight.w700,
          color: textColor ?? AppPalette.white,
          fontSize: size ?? 24));
}

getFormatedDate(String date) {
  // 2024-08-10T17:47:11.690902
  var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.S");
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('hh:mm a');
  return outputFormat.format(inputDate);
}
