import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class AddNewChecklistScreen extends StatefulWidget {
  const AddNewChecklistScreen({super.key});

  @override
  State<AddNewChecklistScreen> createState() => _AddNewChecklistScreenState();
}

class _AddNewChecklistScreenState extends State<AddNewChecklistScreen> {
  final checklistController =
      Get.put<ChecklistController>(ChecklistController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Chips Agent',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppPalette.white,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () => appRoute.pop(),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/back.svg",
                    colorFilter: const ColorFilter.mode(
                        AppPalette.black, BlendMode.srcIn)),
              ),
            ),
          )),
      body: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Steppers(
                  direction: StepperDirection.horizontal,
                  labels: checklistController.stepsData,
                  currentStep: checklistController.currentScreen.value,
                  stepBarStyle: StepperStyle(
                    activeColor: AppPalette.primary.primary400,
                    maxLineLabel: 9,
                    //   inactiveColor: DSColors.purple100
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello World',
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.black,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    //TODO Continue here
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
