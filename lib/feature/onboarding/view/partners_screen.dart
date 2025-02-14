import 'package:auto_route/annotations.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/onboarding/provider/onboarding_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/state_manager.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class PartnersScreen extends StatefulWidget {
  const PartnersScreen({super.key});

  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  final onboardingController =
      Get.put<OnboardingController>(OnboardingController());

  @override
  void initState() {
    super.initState();
    onboardingController.gotoGetStarted();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  50.height,
                  Text(
                    'Partner With:',
                    textAlign: TextAlign.center,
                    style: context.theme.appTextTheme.bodySmall14.copyWith(
                      color: AppPalette.primary.primary400,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.18,
                    ),
                  ),
                  44.height,
                  Image.asset(
                    Assets.images.partner1.path,
                  ),
                  Image.asset(
                    Assets.images.partner2.path,
                  ),
                  Image.asset(
                    Assets.images.partner3.path,
                  ),
                  16.height,
                  Image.asset(
                    Assets.images.partner4.path,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
