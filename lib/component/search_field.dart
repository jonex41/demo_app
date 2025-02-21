import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';

import '../../gen/assets.gen.dart';
import '../core/theme/new_theme/app_color.dart';

class MySearchWidget extends StatelessWidget {
  const MySearchWidget(
      {super.key, required this.controller, required this.callBack});
  final TextEditingController controller;
  final Function(String) callBack;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 4, 4, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // radius of 10
          //  color: AppPalette.grey.gray150, // green as background color
        ),
        child: TextField(
          controller: controller,
          onChanged: callBack,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            fillColor: AppPalette.grey.gray150,
            hintText: "Search for users’ name",
            hintStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                color: AppPalette.grey.gray360, fontWeight: FontWeight.w400),
            prefixIcon: SizedBox(
              height: 10,
              width: 10,
              child: SvgPicture.asset(Assets.icons.search.path,
                  height: 5, width: 5, fit: BoxFit.scaleDown),
            ),
            /*  border: OutlineInputBorder(
              borderSide: BorderSide(color: AppPalette.grey.gray150),
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            ), */
          ),
        ),
      ),
    );
  }
}
