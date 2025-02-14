import 'package:demo_app/component/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../core/theme/new_theme/app_color.dart';

class MyDropDownWidget extends HookWidget {
  const MyDropDownWidget(
      {super.key,
      required this.titile,
      this.hintText = "Select your answer",
      required this.children,
      required this.isEnabled,
      this.showRequired = false,
      this.validator,
      required this.onChange});
  final String titile;
  final String hintText;
  final List<String> children;
  final bool isEnabled, showRequired;
  final Function(String value) onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState('');
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  titile,
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
                      color: AppPalette.red.red300,
                      fontWeight: FontWeight.w600),
                ),
            ],
          ),
          5.height,
          /*  DropdownButtonFormField2<String>(
            validator: validator,
            decoration: inputDecoration(
              borderColor: AppPalette.grey.gray300,
              fillColor: AppPalette.white,
              /*   suffixIcon: SvgPicture.asset(Assets.images.icons.arrowDown.path,
                  height: 5, width: 5, fit: BoxFit.scaleDown), */
            ),
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    hintText,
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.appTextTheme.bodySmall14.copyWith(
                      color: AppPalette.grey.gray350,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            items: [...children]
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: SizedBox(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue.value.trim().isEmptyOrNull
                ? null
                : selectedValue.value,
            onChanged: (value) {
              selectedValue.value = value!;
              onChange(value);
            },
            buttonStyleData: ButtonStyleData(
              height: 20,
              padding: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
                color: AppPalette.white,
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
              ),
              iconSize: 18,
              /*   iconEnabledColor: Colors.grey,
              iconDisabledColor: Colors.grey, */
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 50,
              padding: EdgeInsets.only(right: 14),
            ),
          ),
 */
          DropdownButtonFormField<String>(
            validator: validator,
            isExpanded: true,
            icon: const SizedBox(
              height: 0,
              width: 0,
            ),
            decoration: inputDecoration(
              borderColor: AppPalette.grey.gray300,
              fillColor: AppPalette.white,
              suffixIcon: SvgPicture.asset(Assets.icons.arrowDown.path,
                  height: 5, width: 5, fit: BoxFit.scaleDown),
            ),
            hint: Text(
              hintText,
              overflow: TextOverflow.ellipsis,
              style: context.theme.appTextTheme.bodySmall14.copyWith(
                color: AppPalette.grey.gray350,
                fontWeight: FontWeight.w400,
              ),
            ),
            items: [...children].map((String value) {
              return DropdownMenuItem<String>(
                enabled: isEnabled,
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    color: AppPalette.dark.dark50,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              onChange(value!);
            },
          )
        ],
      ),
    );
  }
}
