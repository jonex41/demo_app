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
        if (isOnline)
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.25), // border color
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2), // border width
              child: Container(
                // or ClipRRect if you need to clip the content
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green, // inner circle color
                ),
                child: Container(), // inner content
              ),
            ),
          ),
        /*  const Spacer(),

        Align(
            alignment: Alignment.topRight,
            child: Assets.images.icons.notification.image()), */
        5.width
      ],
    );
  }
}
