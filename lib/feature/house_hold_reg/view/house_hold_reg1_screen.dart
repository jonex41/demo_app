import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
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
class HouseHoldReg1Screen extends GetView<HouseHoldRegController> {
  const HouseHoldReg1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppPalette.primary.primary55,
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
                GestureDetector(
                  onTap: () {
                    appRoute.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Assets.icons.backPage.svg(
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                15.height,
                Row(
                  children: [
                    Text(
                      'Household Registration',
                      style: context.theme.appTextTheme.titleSmall24.copyWith(
                          color: AppPalette.white, fontWeight: FontWeight.w500),
                    ),
                    //  Assets.icons.wave.image(),
                  ],
                ),
                6.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Household Registration: Collecting household information ',
                    style: context.theme.appTextTheme.labelLarge12.copyWith(
                        color: AppPalette.white, fontWeight: FontWeight.w400),
                  ),
                ),
                Assets.images.firstVisit.svg(height: context.height / 3.5),
                Transform.translate(
                  offset: const Offset(0, -15),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {

                          appRoute.push(const HouseHoldRegListRoute());
                        },
                        child: _card(
                            context,
                            "Household register form",
                            const Icon(
                              Icons.group,
                              color: Colors.white,
                            ),
                            false),
                      ),
                      20.height,
                      GestureDetector(
                        onTap: () {
                         // appRoute.push(const ChildHealth1Route());
                        },
                        child: _card(
                            context,
                            "Child Health: Focused Care for\nChild's Well-being",
                            const Icon(Icons.person, color: Colors.white),
                            true),
                      ),
                    ],
                  ),
                ),
                40.height,
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _card(BuildContext context, String s, Icon image, bool isSecond) {
    return Container(
        width: double.infinity,
        height: context.height / 5,
        decoration: BoxDecoration(
          color: const Color(0xff027d5266).withOpacity(0.1),
          border: Border.all(
            color: Colors.white, // White border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding:
            const EdgeInsets.all(16.0), // Optional padding inside the container
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isSecond)
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        height: 40.w,
                        width: 40.w,
                        color: const Color(0xff027d5233).withOpacity(0.2),
                        child: Center(child: image))),
              5.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s,
                    style: context.theme.appTextTheme.labelLarge12.copyWith(
                        color: AppPalette.white, fontWeight: FontWeight.w400),
                  ),
                  if (isSecond)
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    )
                ],
              ),
              5.height,
              if (!isSecond)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: context.width / 2.5,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Background color (optional)
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
                          'View & Fill Form',
                          style: context.theme.appTextTheme.labelLarge12
                              .copyWith(
                                  color: AppPalette.white,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
