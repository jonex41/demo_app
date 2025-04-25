import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

class HomeHeaderWidget extends GetView<HomeController> {
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
          width: 50,
          height: 50,
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
        10.width,
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
          child: Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.onlineOffline.value
                        ? AppPalette.green
                        : AppPalette.red.red350,
                    shape: BoxShape.circle,
                  ),
                ),
                5.width,
                Text(
                  controller.onlineOffline.value ? "Online" : "Offline",
                  style: context.theme.appTextTheme.labelLarge10.copyWith(
                      fontWeight: FontWeight.w400,
                      color: controller.onlineOffline.value
                          ? AppPalette.green
                          : AppPalette.red.red350),
                ),
              ],
            ),
          ),
          //  Assets.images.notification.image()
        ),
        5.width
      ],
    );
  }
}
