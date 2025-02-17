import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:demo_app/feature/encounter_reg_house/widget/search_item.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../component/search_field.dart';

@RoutePage()
class EncouterRegHouseRecord1Screen
    extends GetView<EncouterRegHouseController> {
  const EncouterRegHouseRecord1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
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
                  "Hauwa Abdullahi Sani Records",
                  style: context.theme.appTextTheme.bodyMedium16.copyWith(
                      color: AppPalette.black, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            15.height,
            GestureDetector(
              onTap: () {
                appRoute.push(const EncouterRegHouseRecordDetailsRoute());
              },
              child: Container(
                width: context.width - 30,
                // height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: const Color(0xff7A7C7F),
                    width: 1.0, // Outline width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _myCircle(context, "UTT"),
                      10.height,
                      Text(
                        "Hauwa Abdullahi Sani",
                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                            color: AppPalette.black,
                            fontWeight: FontWeight.w800),
                      ),
                      10.height,
                      Text(
                        "Tell: +234 706 580 8595 | Age: 45years",
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: const Color(0xff7A7C7F),
                            fontWeight: FontWeight.w800),
                      ),
                      10.height,
                      Row(
                        children: [
                          Row(
                            children: [
                              Assets.icons.calendar.svg(
                                color: const Color(0xff7A7C7F),
                              ),
                              5.width,
                              Text(
                                "04/04/2023",
                                style: context.theme.appTextTheme.labelLarge12
                                    .copyWith(
                                        color: const Color(0xff7A7C7F),
                                        fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          20.width,
                          Row(
                            children: [
                              Assets.icons.clock.svg(
                                color: const Color(0xff7A7C7F),
                              ),
                              5.width,
                              Text(
                                "05:38PM",
                                style: context.theme.appTextTheme.labelLarge12
                                    .copyWith(
                                        color: const Color(0xff7A7C7F),
                                        fontWeight: FontWeight.w800),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.height,
            AppElevatedButton(
              width: context.width,
              onPressed: () {
                appRoute.push(const EncounterRegHouse1Route());
              },
              text: "Add New Record",
              height: 50,
              color: AppPalette.primary.primary400,
            ),
            20.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Check-List Record",
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    color: AppPalette.black, fontWeight: FontWeight.w800),
              ),
            ),
            10.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _halfChild(
                  context,
                  "Records Added",
                  "30",
                  const Color(0xffD72feB).withOpacity(0.2),
                  AppPalette.primary.primary400,
                  const Color(0xffee647133).withOpacity(0.2),
                ),
                5.width,
                _halfChild(
                  context,
                  "Pending Schedule",
                  "1",
                  const Color(0xffF8FFE6),
                  const Color(0xff92CE00),
                  const Color(0xffd72feb33).withOpacity(0.2),
                ),
              ],
            ),
            15.height,
            _horizontalCard(context),
            5.height,
            _horizontalCard(context),
          ],
        ),
      ),
    ));
  }

  Widget _myCircle(BuildContext context, String s) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            height: 40.w,
            width: 40.w,
            color: const Color(0xffECA3F5),
            child: const Center(
              child: Text(
                "U",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            )));
  }

  _halfChild(BuildContext context, String s, String t, Color color1,
      Color color2, Color colors3) {
    return Container(
      width: context.width / 2 - 30,
      height: context.height / 5,
      decoration: BoxDecoration(
        color: color1,
        border: Border.all(
          color: colors3, // White border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.group,
              color: color2,
              size: 12,
            ),
            40.height,
            Text(
              s,
              style: context.theme.appTextTheme.bodySmall14.copyWith(
                  color: AppPalette.black, fontWeight: FontWeight.w600),
            ),
            10.height,
            Text(
              t,
              style: context.theme.appTextTheme.labelLarge12.copyWith(
                  color: AppPalette.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _horizontalCard(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Container(
        width: context.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  10.width,
                  _myCircle(context, "T"),
                  15.width,
                  Column(
                    children: [
                      Text(
                        "Hauwa Abdullahi Sani",
                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                            color: AppPalette.black,
                            fontWeight: FontWeight.w800),
                      ),
                      10.height,
                      Row(
                        children: [
                          Row(
                            children: [
                              Assets.icons.calendar.svg(
                                color: const Color(0xff7A7C7F),
                              ),
                              5.width,
                              Text(
                                "04/04/2023",
                                style: context.theme.appTextTheme.labelLarge12
                                    .copyWith(
                                        color: const Color(0xff7A7C7F),
                                        fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          20.width,
                          Row(
                            children: [
                              Assets.icons.clock.svg(
                                color: const Color(0xff7A7C7F),
                              ),
                              5.width,
                              Text(
                                "05:38PM",
                                style: context.theme.appTextTheme.labelLarge12
                                    .copyWith(
                                        color: const Color(0xff7A7C7F),
                                        fontWeight: FontWeight.w800),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
