import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../gen/assets.gen.dart';
import '../core/router/locator.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar(
      {super.key, required this.title, this.textColor, this.onPress});
  final String title;
  final Color? textColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: onPress ??
                  () {
                    appRoute.pop();
                  },
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Assets.icons.backPage.svg(color: textColor))),
          25.width,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: context.theme.appTextTheme.titleSmall24
                  .copyWith(fontWeight: FontWeight.w600, color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
