import 'package:demo_app/component/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../core/theme/new_theme/app_color.dart';

class MyInputTextWidget extends StatelessWidget {
  const MyInputTextWidget(
      {super.key,
      required this.controller,
      required this.title,
      this.title2,
      required this.hint,
      this.showRequired = false,
      this.keyboardType,
      this.maxLine,
      this.textColor,
      this.validator,
      this.power,
      required this.callBack});
  final TextEditingController controller;
  final String title;
  final String? title2;
  final String hint;
  final int? maxLine;
  final String? power;
  final Color? textColor;
  final bool showRequired;
  final Function(String) callBack;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (power != null)
              Flexible(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: title,
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        //s color: AppPalette.dark.dark50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(2, -4),
                        child: Text(
                          power!,
                          //superscript is usually smaller in size
                          textScaleFactor: 0.7,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: title2,
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
                ),
              ),
            if (power == null)
              Flexible(
                child: Text(
                  title,
                  style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    color: textColor ?? AppPalette.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            if (showRequired)
              Text(
                ' *',
                style: context.theme.appTextTheme.bodyLarge18.copyWith(
                    color: AppPalette.red.red300, fontWeight: FontWeight.w600),
              ),
          ],
        ),
        TextFormField(
            controller: controller,
            onChanged: callBack,
            
            maxLines: maxLine,
            keyboardType: keyboardType,
            validator: validator,
            
            decoration: inputDecoration(
              hintText: hint,
              hintStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                  color: AppPalette.grey.gray360, fontWeight: FontWeight.w400),
            )),
        10.height
      ],
    );
  }
}
