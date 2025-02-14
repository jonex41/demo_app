import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../core/theme/new_theme/app_color.dart';

void showMyDialog(
    {required BuildContext context,
    required String body,
    required Function() onTap}) async {
  await showInDialog(context,
      contentPadding: const EdgeInsets.all(0),
      builder: (context) => ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: AppPalette.primary.primary10,
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 350,
                  width: 300,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            appRoute.pop();
                          },
                          child: const Icon(
                            Icons.close,
                            size: 24,
                          ),
                        ),
                      ),
                      10.height,
                      Assets.images.successful.svg(),
                      const Spacer(),
                      Text(
                        'Congratulation!',
                        style: context.theme.appTextTheme.titleSmall24.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppPalette.primary.primary400),
                      ),
                      Text(
                        body,
                        textAlign: TextAlign.center,
                        style: context.theme.appTextTheme.bodySmall14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppPalette.dark.dark50),
                      ),
                      10.height,
                      AppElevatedButton(
                        textColor: AppPalette.white,
                        color: AppPalette.primary.primary400,
                        height: 56,
                        //   width: MediaQuery.of(context).size.width - 80,
                        //   width: MediaQuery.of(context).size.width - 80,
                        text: 'Done',
                        onPressed: () async {
                          onTap();
                          //appRoute.replaceAll([const DashboardRoute()]);
                        },
                        /*  textStyle: context.theme.appTextTheme.labelLarge12.copyWith(
                  color: AppPalette.white, fontWeight: FontWeight.w400), */
                      ),
                      20.height,
                    ],
                  )),
            ),
          ),
      dialogAnimation: DialogAnimation.SLIDE_BOTTOM_TOP);
}
