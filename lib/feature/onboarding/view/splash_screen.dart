import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/onboarding/provider/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/state_manager.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final onboardingController =
      Get.put<OnboardingController>(OnboardingController());
  @override
  void initState() {
    super.initState();
    onboardingController.gotoGetStarted();
    // onboardingController.gotoPartnersScreen();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        body: Container(
          color: AppPalette.white,
          child: Center(
            child: Stack(
              children: [
                //SvgPicture.asset("assets/images/onboarding_logo.svg"),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'eCHIS ',
                    style: context.theme.appTextTheme.headlineMedium32.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w800),
                  ),
                ),

                /*   Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/partners.png",
                    height: 200,
                    width: 200,
                  ),
                ) */

                /* Text(
                'OptiCCS',
                style: context.theme.appTextTheme.headlineLarge40.copyWith(
                    color: AppPalette.primary.primary400,
                    fontSize: 43,
                    fontWeight: FontWeight.w900),
              ), */
              ],
            ),
          ),
        ),
      ));
    });
  }
}
