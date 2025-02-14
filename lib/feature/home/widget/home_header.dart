import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget(
      {super.key,
      required this.name,
      required this.time,
      this.isOnline = false});
  final String name;
  final String time;
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //margin: EdgeInsets.all(20),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppPalette.primary.primary10,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: context.theme.appTextTheme.bodyLarge18.copyWith(
                  fontWeight: FontWeight.w500, color: AppPalette.black),
            ),
          ),
        ),
        20.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$time ',
                  style: context.theme.appTextTheme.bodySmall14
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Assets.icons.wave.image(),
              ],
            ),
            Text(
              name,
              style: context.theme.appTextTheme.bodyMedium16
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const Spacer(),
        Align(
            alignment: Alignment.topRight,
            child: Assets.images.notification.image()),
        5.width
      ],
    );
  }
}
