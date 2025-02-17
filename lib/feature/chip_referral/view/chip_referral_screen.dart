import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/chip_referral/provider/chip_referral_controller.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:demo_app/feature/house_hold_reg/provider/house_hold_reg_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class ChipReferralScreen extends GetView<ChipReferralController> {
  const ChipReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /*   decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.login.path),
            fit: BoxFit.cover,
          ),
        ), */
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
              children: [
                20.height,
                Row(
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
                      'CHIPS Referral',
                      style: context.theme.appTextTheme.titleSmall24.copyWith(
                          color: AppPalette.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    ),
                    //  Assets.icons.wave.image(),
                  ],
                ),
                15.height,
                Card(
                  surfaceTintColor: Colors.white,
                  child: Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          color: Colors.white,
                          child: Text(
                            'Dashboard',
                            style: context.theme.appTextTheme.titleSmall24
                                .copyWith(
                                    color: AppPalette.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                15.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'CHIPS Referral Activity Log',
                    style: context.theme.appTextTheme.titleSmall24.copyWith(
                        color: AppPalette.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ),
                15.height,
                Card(
                  surfaceTintColor: Colors.white,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          15.height,
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // appRoute.push(const MaternalService1Route());
                                  },
                                  child: _card(
                                    context,
                                    "Total Registered CHIPS Referral",
                                    Icon(
                                      Icons.house_outlined,
                                      color: AppPalette.primary.primary400,
                                    ),
                                    true,
                                    const Color(0xffEEFFF9),
                                    AppPalette.primary.primary400,
                                  ),
                                ),
                              ),
                              10.width,
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // appRoute.push(const MaternalService1Route());
                                  },
                                  child: _card(
                                    context,
                                    "Expired CHIPS Referral",
                                    const Icon(
                                      Icons.house_outlined,
                                      color: Color(0xff92CE00),
                                    ),
                                    true,
                                    const Color(0xffF8FFE6),
                                    const Color(0xff92CE00),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          20.height,
                          GestureDetector(
                            onTap: () {
                              // appRoute.push(const ChildHealth1Route());
                            },
                            child: _card(
                              context,
                              "Total Registered Household Members",
                              const Icon(
                                Icons.person,
                                color: Color(0xffEE6471),
                              ),
                              true,
                              const Color(0xffFFF7F2),
                              const Color(0xffEE6471),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                20.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'CHIPS Referral Registration',
                    style: context.theme.appTextTheme.titleSmall24.copyWith(
                        color: AppPalette.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ),
                15.height,
                GestureDetector(
                  onTap: () {
                    // appRoute.push(const HouseHoldReg1Route());
                  },
                  child: _card(
                    context,
                    "Register a CHIPS Referral",
                    Icon(
                      Icons.person,
                      color: AppPalette.primary.primary400,
                    ),
                    false,
                    const Color(0xffEEFFF9),
                    AppPalette.primary.primary400,
                  ),
                ),
                15.height,
                GestureDetector(
                  onTap: () {
                    // appRoute.push(const HouseHoldReg1Route());
                  },
                  child: _card(
                    context,
                    "View Registered CHIPS Referral",
                    Icon(
                      Icons.person,
                      color: AppPalette.primary.primary400,
                    ),
                    false,
                    const Color(0xffF9FAFB),
                    AppPalette.primary.primary400,
                  ),
                ),
                40.height,
              //  Assets.images.germanLogo.image(),
                40.height,
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _card(BuildContext context, String s, Icon image, bool showSubTitle,
      Color cardColor, Color iconColor) {
    return Container(
        width: double.infinity,
        height: context.height / 5,
        decoration: BoxDecoration(
          color: cardColor,
          /*  border: Border.all(
            // color: const Color(0xff2fcf9733)
            // .withOpacity(0.2), // White border color
            width: 1.0, // Border width
          ), */
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding:
            const EdgeInsets.all(16.0), // Optional padding inside the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0.5,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 30.w,
                      width: 30.w,
                      color: cardColor,
                      child: Center(child: image))),
            ),
            15.height,
            Text(
              s,
              style: context.theme.appTextTheme.labelLarge12.copyWith(
                  color: AppPalette.black, fontWeight: FontWeight.w600),
            ),
            5.height,
            if (showSubTitle)
              Text(
                "1,082",
                style: context.theme.appTextTheme.labelLarge12.copyWith(
                    color: const Color(0xff667185),
                    fontWeight: FontWeight.w400),
              ),
            5.height,
            if (!showSubTitle)
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    appRoute.push(const ChipReferral1Route());
                  },
                  child: Container(
                    width: context.width / 2.5,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppPalette
                          .primary.primary400, // Background color (optional)
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 2.0, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Start Registration',
                          style: context.theme.appTextTheme.labelLarge12
                              .copyWith(
                                  color: AppPalette.white,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
