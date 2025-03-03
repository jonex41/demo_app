import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../../gen/assets.gen.dart';

import '../../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class MaternalService1Screen extends GetView<EncouterRegMatController> {
  const MaternalService1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //  color: AppPalette.primary.primary55,
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
                    10.width,
                    Text(
                      'Maternal Services: Caring for\nPregnant Women',
                      style: context.theme.appTextTheme.bodyLarge18.copyWith(
                          color: AppPalette.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        5.height,
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Dashboard',
                            style: context.theme.appTextTheme.bodyLarge18
                                .copyWith(
                                    color: AppPalette.black,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        10.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _halfChild(
                                context,
                                "Pregnancy\nRegistrations",
                                "1,082",
                                const Color(0xffEEFFF9),
                                AppPalette.primary.primary400,
                                const Color(0xff2fcf9733).withOpacity(0.2)),
                            5.width,
                            _halfChild(
                                context,
                                "Total Deliveries",
                                "1,082",
                                const Color(0xffF8FFE6),
                                const Color(0xff92CE00),
                                const Color(0xffc4ff3433).withOpacity(0.2)),
                          ],
                        ),
                        10.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _halfChild(
                              context,
                              "High-Risk Cases",
                              "1,082",
                              const Color(0xffFFF7F2),
                              const Color(0xffee647133),
                              const Color(0xffee647133).withOpacity(0.2),
                            ),
                            5.width,
                            _halfChild(
                              context,
                              "Postnatal Visits\nCompleted",
                              "1,082",
                              const Color(0xffFEF6FF),
                              const Color(0xffd72feb33),
                              const Color(0xffd72feb33).withOpacity(0.2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                20.height,
                Text(
                  'Caring for Pregnant Women',
                  style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      color: AppPalette.black, fontWeight: FontWeight.w600),
                ),
                15.height,
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        appRoute.push(const MaternalServiceListRoute());
                      },
                      child: _card(
                        context,
                        "Pregnant Women\nRegistered",
                        "View all",
                        const Icon(
                          Icons.group,
                          color: Colors.grey,
                        ),
                        const Color(0xffF9FAFB),
                        const Color(0xffe4e7ec33).withOpacity(0.2),
                      ),
                    ),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        appRoute.push(const MaternalReg1Route());
                      },
                      child: _card(
                          context,
                          "Register a Newborn &\nMother’s Details",
                          "Start Registration",
                          Icon(Icons.person,
                              color: AppPalette.primary.primary400),
                          const Color(0xffEEFFF9),
                          const Color(0xff2fcf9733).withOpacity(0.2)),
                    ),
                  ],
                ),
                20.height,
                //  Assets.images.germanLogo.image(),
                40.height,
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _card(BuildContext context, String s, String buttonName, Icon image,
      Color container, Color border) {
    return Container(
        width: double.infinity,
        height: context.height / 4.5,
        decoration: BoxDecoration(
          color: container,
          border: Border.all(
            color: border, // White border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding:
            const EdgeInsets.all(16.0), // Optional padding inside the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: container,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(
                        color: container,
                        border: Border.all(
                          color: border, // White border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                      ),
                      height: 40.w,
                      width: 40.w,
                      // color: container,
                      child: Center(child: image))),
            ),
            5.height,
            Text(
              s,
              style: context.theme.appTextTheme.bodySmall14.copyWith(
                  color: AppPalette.black2, fontWeight: FontWeight.w600),
            ),
            5.height,
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  //  width: context.width / 2.5,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Background color (optional)
                    border: Border.all(
                      color: Colors.white, // White border color
                      width: 0.5, // Border width
                    ),
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          //  controller.gotoEveryScreen();
                          // controller.gotoGettingReady();
                        },
                        child: _buttonWithArrow(
                            context,
                            buttonName,
                            AppPalette.primary.primary10,
                            AppPalette.primary.primary400,
                            16),
                      ),
                      14.width,
                    ],
                  )),
            )
          ],
        ));
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
              style: context.theme.appTextTheme.bodySmall14.copyWith(
                  color: AppPalette.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonWithArrow(BuildContext context, String name, Color textColor,
      Color containerColor, double fontSize) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // radius of 10
            color: containerColor // green as background color
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: context.theme.appTextTheme.bodyLarge18.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize),
            ),
            5.width,
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: textColor,
            )
            //Assets.images.icons.wave.image(),
          ],
        ));
  }
}
