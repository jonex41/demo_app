import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';
import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class EncouterRegHouseLogScreen extends GetView<EncouterRegHouseController> {
  const EncouterRegHouseLogScreen({super.key});

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
            const AppAppBar(title: "Activity Log", ),
            // 10.height,
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
                        const Color(0xffFCE2FF),
                        AppPalette.white,
                        "Patients",
                        "6990",
                        Assets.icons.smallPaper.path),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      //controller.gotoEveryVisit();
                    },
                    child: _myContainer(
                        context,
                        const Color(0xffD72FEB),
                        AppPalette.white,
                        "Households",
                        "5687",
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
                      // controller.gotoSchedule();
                    },
                    child: _myContainer(
                        context,
                        const Color(0xffD72FEB),
                        AppPalette.white,
                        "Schedule",
                        "3455",
                        Assets.icons.smallCalendar.path),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      //controller.gotoDelivery();
                    },
                    child: _myContainer(
                        context,
                        const Color(0xffFCE2FF),
                        AppPalette.white,
                        "Visit",
                        "3422",
                        Assets.icons.smallPaper.path),
                  ),
                ),
              ],
            ),
            20.height,
            InkWell(
              onTap: () {
                // controller.gotoTest();
              },
              child: _myContainer(
                  context,
                  const Color(0xffD72FEB),
                  AppPalette.white,
                  "Total Records Added",
                  "2344",
                  Assets.icons.smallPaper.path),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _myContainer(BuildContext context, Color cardColor, Color othrColor,
      String title, String amount, String imagePath) {
    return Card(
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
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, // radius of 10
                  color: othrColor // green as background color
                  ),
              child: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  imagePath,
                  height: 8,
                  width: 8,
                  fit: BoxFit.scaleDown,
                  color: const Color(0xffD72FEB),
                ),
              ),
            ),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: context.theme.appTextTheme.headlineMedium32.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppPalette.lime1.lime50),
                ),
                Text(
                  title,
                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppPalette.lime1.lime50),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
