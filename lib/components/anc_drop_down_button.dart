import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AncDropDownButton extends StatelessWidget {
  final String? value;
  final String? hint;
  final List<String>? items;
  final GlobalKey<FormFieldState>? keyVal;
  final Function(dynamic value)? onChanged;
  final String? Function(String?)? validator;

  const AncDropDownButton(
      {super.key,
      this.value,
      this.hint,
      this.items,
      this.onChanged,
      this.keyVal,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<String>(
          key: keyVal,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintStyle: const TextStyle(fontSize: 16),
            //te: const TextStyle(fontSize: 16),
            contentPadding: const EdgeInsets.only(
              right: 10,
              left: 10,
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppPalette.grey.gray300, width: 1.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppPalette.grey.gray300, width: 1.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppPalette.grey.gray300, width: 1.0),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(5)),
          ),
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Select an Option';
                } else {
                  return null;
                }
              },
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          value: value,
          isExpanded: true,
          isDense: true,
          items: items?.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontSize: 16,
                  color: AppPalette.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          hint: Text(
            hint ?? '',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              fontSize: 16,
              color: AppPalette.grey.gray600,
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}
