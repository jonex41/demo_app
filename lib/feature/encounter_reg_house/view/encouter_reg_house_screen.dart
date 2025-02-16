import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class EncouterRegHouseScreen extends GetView<EncouterRegHouseController> {
  const EncouterRegHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffFCE2FF),
      body: Container(
        //  color: AppPalette.primary.primary55,
        /*   decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.login.path),
            fit: BoxFit.cover,
          ),
        ), */
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
              children: [
                20.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        appRoute.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Assets.icons.backPage.svg(
                          height: 30,
                          width: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    20.width,
                    Text(
                      "Encounter Register\nHousehold",
                      style: context.theme.appTextTheme.titleSmall24.copyWith(
                          color: AppPalette.black, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                15.height,
                6.height,
                Text(
                  "New Patient",
                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                      color: AppPalette.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Get started for to update your personal\ninformation",
                    style: context.theme.appTextTheme.labelLarge12.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w400),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Assets.images.encounterRegHouse
                      .image(height: context.height / 3.5),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        appRoute.push(const EncounterRegHouse1Route());
                      },
                      child: _card(
                          context,
                          "Start New Household Encounter ",
                          const Icon(
                            Icons.group,
                            color: Colors.white,
                          )),
                    ),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        appRoute.push(const EncouterRegHouseRecordRoute());
                      },
                      child: _card(context, "Records (Update,View) ",
                          const Icon(Icons.person, color: Colors.white)),
                    ),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        appRoute.push(const EncouterRegHouseScheduleRoute());
                      },
                      child: _card(context, "Schedules",
                          const Icon(Icons.person, color: Colors.white)),
                    ),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        appRoute.push(const EncouterRegHouseLogRoute());
                      },
                      child: _card(context, "Logs ",
                          const Icon(Icons.person, color: Colors.white)),
                    ),
                  ],
                ),
                40.height,
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _card(BuildContext context, String s, Icon image) {
    return Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xffD72FEB),

          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding:
            const EdgeInsets.all(16.0), // Optional padding inside the container
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s,
              style: context.theme.appTextTheme.bodySmall14.copyWith(
                  color: AppPalette.white, fontWeight: FontWeight.w800),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          ],
        ));
  }
}
