import 'package:auto_route/annotations.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/activity/provider/actiivity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';
import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class ActivityScreen extends GetView<ActivityController> {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.getData();
    /*   var size = MediaQuery.of(context).size;

    
    final double itemHeight = (size.height - kToolbarHeight - 320) / 2;
    final double itemWidth = size.width / 2; */
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Activity",
                style: context.theme.appTextTheme.titleSmall24.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            10.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Track your recent submissions and actions\nwith timestamps and status updates.",
                style: context.theme.appTextTheme.bodySmall14.copyWith(
                    color: const Color(0xff8B8D97),
                    fontWeight: FontWeight.w400),
              ),
            ),
            30.height,
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // controller.gotoFistVisit();
                    },
                    child: _myContainer(
                        context,
                        const Color(0xffEEFFF9),
                        const Color(0xff2fcf9733).withOpacity(0.2),
                        "Pending Sync",
                        "2333",
                        Assets.icons.smallPaper.path),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // controller.gotoEveryVisit();
                    },
                    child: _myContainer(
                        context,
                        const Color(0xffFFF7F2),
                        const Color(0xff2fcf9733).withOpacity(0.2),
                        "Households",
                        "4454",
                        Assets.icons.smallPaper.path),
                  ),
                ),
              ],
            ),
            20.height,
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      //  controller.gotoSchedule();
                    },
                    child: _myContainer(
                        context,
                        const Color(0xffFFF7F2),
                        const Color(0xff2fcf9733).withOpacity(0.2),
                        "Households",
                        "9099",
                        Assets.icons.smallCalendar.path),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // controller.gotoDelivery();
                    },
                    child: _myContainer(
                        context,
                        const Color(0xffEEFFF9),
                        const Color(0xff2fcf9733).withOpacity(0.2),
                        "Total Pregnant\nWomen",
                        "2344",
                        Assets.icons.smallPaper.path),
                  ),
                ),
              ],
            ),
            20.height,
          ],
        ),
      ),
    ));
  }

  Widget _myContainer(BuildContext context, Color cardColor, Color othrColor,
      String title, String amount, String imagePath) {
    return SizedBox(
      height: context.height / 5,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*  Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, // radius of 10
                    color: othrColor // green as background color
                    ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(imagePath,
                      height: 8, width: 8, fit: BoxFit.scaleDown),
                ),
              ),
              10.width, */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.theme.appTextTheme.bodySmall14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1D2739)),
                  ),
                  Text(
                    amount,
                    style: context.theme.appTextTheme.titleLarge28.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff667185)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
