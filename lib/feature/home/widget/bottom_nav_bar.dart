import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';

class MyBottomNavBar extends GetView<HomeController> {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.selectedTab.value = 0;
              appRoute.pop();
            },
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: controller.selectedTab.value == 0
                      ? AppPalette.primary.primary400
                      : AppPalette.white,
                  shape: BoxShape.circle,
                ),
                child: controller.selectedTab.value == 0
                    ? Assets.icons.homeWhite
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)
                    : Assets.icons.homeBlue
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)),
          ),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.selectedTab.value = 1;
              appRoute.pop();
              controller.canShowTransaction.value = true;
            },
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: controller.selectedTab.value == 1
                      ? AppPalette.primary.primary400
                      : AppPalette.white,
                  shape: BoxShape.circle,
                ),
                child: controller.selectedTab.value == 1
                    ? Assets.icons.transactionWhite
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)
                    : Assets.icons.transactionBlue
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)),
          ),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.selectedTab.value = 2;
              appRoute.pop();
              controller.canShowSend.value = true;
            },
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: controller.selectedTab.value == 2
                      ? AppPalette.primary.primary400
                      : AppPalette.white,
                  shape: BoxShape.circle,
                ),
                child: controller.selectedTab.value == 2
                    ? Assets.icons.sendWhite
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)
                    : Assets.icons.sendBlue
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)),
          ),
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.selectedTab.value = 3;
              appRoute.pop();
              controller.canShowMore.value = true;
            },
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: controller.selectedTab.value == 3
                      ? AppPalette.primary.primary400
                      : AppPalette.white,
                  shape: BoxShape.circle,
                ),
                child: controller.selectedTab.value == 3
                    ? Assets.icons.profileWhite
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)
                    : Assets.icons.profileBlue
                        .svg(height: 40, width: 40, fit: BoxFit.scaleDown)),
          ),
        ),
      ],
    );
  }
}
