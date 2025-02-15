import 'package:auto_route/auto_route.dart';
import 'package:demo_app/components/my_button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:demo_app/feature/checklist/widget/checklist_screen1.dart';
import 'package:demo_app/feature/checklist/widget/checklist_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
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
          title: Obx(() {
            return Text(
              checklistController.currentScreen.value == 1
                  ? 'Chips Agent'
                  : '1000 Days Check list',
              style: context.theme.appTextTheme.bodyMedium16.copyWith(
                color: AppPalette.black,
                fontWeight: FontWeight.w600,
              ),
            );
          }),
          centerTitle: true,
          backgroundColor: AppPalette.white,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () {
                if (checklistController.currentScreen.value == 1) {
                  appRoute.pop();
                  return;
                }
                checklistController.currentScreen.value--;
              },
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
              Obx(() {
                return Expanded(
                  child: getRightBody(),
                );
              }),
              Obx(() {
                return updateButtonNext(context);
              }),
              15.height
            ],
          ),
        ),
      ),
    );
  }

  Widget getRightBody() {
    if (checklistController.currentScreen.value == 1) {
      return const ChecklistScreen1();
    } else if (checklistController.currentScreen.value == 2) {
      return const ChecklistScreen2();
    }
    return const ChecklistScreen2();
  }

  Widget updateButtonNext(BuildContext context) {
    return AppElevatedButton(
      textColor: AppPalette.white,
      color: AppPalette.primary.primary400,
      height: 56,
      width: MediaQuery.of(context).size.width - 80,
      radius: 8,
      text: checklistController.currentScreen.value == 2 ? 'Submit' : 'Next',
      onPressed: () async {
        if (checklistController.currentScreen.value == 1) {
          final isValid =
              checklistController.formKeyScreen1.currentState!.validate();
          if (!isValid) {
            return;
          }
        }

        if (checklistController.currentScreen.value == 2) {
          final isValid =
              checklistController.formKeyScreen2.currentState!.validate();
          if (!isValid) {
            return;
          }
        }

        checklistController.currentScreen.value++;

        if (checklistController.currentScreen.value == 3) {
          checklistController.currentScreen.value--;
          //appRoute.push(const AccountVerificationRoute());
          return;
        }
      },
    );
  }
}
