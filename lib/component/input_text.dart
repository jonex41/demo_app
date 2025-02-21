import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../component/input_decoration.dart';
import '../../../core/theme/new_theme/app_color.dart';

class InputWithTextHead extends StatelessWidget {
  const InputWithTextHead(
      {super.key,
      required this.title,
      required this.controller,
      required this.textFieldType,
      this.textColor = AppPalette.white,
      this.suffixColor = AppPalette.white,
      this.anotherColor,
      this.onChange});

  final String title;
  final TextEditingController controller;
  final TextFieldType textFieldType;
  final Color textColor;
  final Color? anotherColor;
  final Color? suffixColor;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(
                title,
                style: context.theme.appTextTheme.labelLarge12
                    .copyWith(color: textColor, fontWeight: FontWeight.w400),
              ),
              Text(
                ' *',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    color: AppPalette.red.red300, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        AppTextField(
          textFieldType: textFieldType,
          decoration: inputDecoration(fillColor: Colors.transparent),
          isValidationRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is required';
            } else {
              return null;
            }
          },
          suffixIconColor:suffixColor?? AppPalette.white,
          onChanged: onChange,
          textStyle: context.theme.appTextTheme.bodySmall14
              .copyWith(color:anotherColor ??textColor, fontWeight: FontWeight.w400),
          controller: controller,
        )
      ],
    );
  }
}
