import 'dart:io';

import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

String formatMoney(String value) {
  final oCcy = NumberFormat("#,##0.00", "en_US");
  return oCcy.format(double.parse(value));
}

String currencyNaire(BuildContext context) {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
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

void snackBar(
  BuildContext context, {
  String title = '',
  Widget? content,
  SnackBarAction? snackBarAction,
  Function? onVisible,
  Color? textColor,
  Color? backgroundColor,
  EdgeInsets? margin,
  EdgeInsets? padding,
  Animation<double>? animation,
  double? width,
  ShapeBorder? shape,
  Duration? duration,
  SnackBarBehavior? behavior,
  double? elevation,
}) {
  if (title.isEmpty && content == null) {
    log('SnackBar message is empty');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        action: snackBarAction,
        margin: margin,
        animation: animation,
        width: width,
        shape: shape,
        duration: duration ?? 4.seconds,
        behavior: margin != null ? SnackBarBehavior.floating : behavior,
        elevation: elevation,
        onVisible: onVisible?.call(),
        content: content ??
            Padding(
              padding: padding ?? EdgeInsets.symmetric(vertical: 4),
              child: Text(
                title,
                style: primaryTextStyle(color: textColor ?? Colors.white),
              ),
            ),
      ),
    );
  }
}

showLoaderDialog(BuildContext context, bool showDialogLoader) {
  if (showDialogLoader == true) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppPalette.primary.primary400,
          ),
          10.width,
          const Text("Please wait...."),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  } else {
    Navigator.of(context).pop();
  }
}
