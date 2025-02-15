import 'package:flutter/material.dart';

import '../core/theme/new_theme/app_color.dart';

InputDecoration inputDecoration(
    {String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? labelText,
    bool isDense = true,
    Color fillColor = AppPalette.white,
    Color? borderColor,
    TextStyle? hintStyle,
    double radius = 4.0,
    bool addVPadding = false}) {
  return InputDecoration(
    alignLabelWithHint: true,
    hintStyle: hintStyle ?? const TextStyle(color: AppPalette.white),
    contentPadding: EdgeInsets.symmetric(
        horizontal: 16, vertical: addVPadding ? 12.0 : 0.0),
    filled: true,
    fillColor: fillColor,

    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    //  isDense: isDense,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor ?? AppPalette.grey.gray300,
        )),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor ?? AppPalette.grey.gray300,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor ?? AppPalette.grey.gray300,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.red,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.red,
        )),
    hintText: hintText,
    labelText: labelText,
  );
}
