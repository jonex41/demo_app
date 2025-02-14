import 'package:demo_app/component/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../core/theme/new_theme/app_color.dart';

class BigInputField extends HookWidget {
  const BigInputField(
      {super.key,
      required this.controller,
      required this.title,
      this.validator,
      this.hint,
      this.maxline,
      this.keyboardType,
      required this.showRequired});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool showRequired;
  final String title;
  final String? hint;
  final TextInputType? keyboardType;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    final textCount = useState(0);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                title,
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  //s color: AppPalette.dark.dark50,
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
        5.height,
        TextFormField(
            controller: controller,
            onChanged: (value) {
              textCount.value = value.length;
            },
            maxLines: maxline??5,
            keyboardType: keyboardType,
            maxLength: 100,
            validator: validator,
            
            decoration: inputDecoration(
                addVPadding: true,
                radius: 10,
                hintText: hint ?? '',
                hintStyle: TextStyle(color: AppPalette.grey.gray300))),
      ],
    );
  }
}
