import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encouter_reg_mat/modal/success_modal.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/childhealth/widgets/new_born_register_screen1.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/childhealth/widgets/new_born_register_screen2.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/childhealth/widgets/new_born_register_screen3.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/childhealth/widgets/new_born_register_screen4.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/childhealth/widgets/new_born_register_screen5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class NewBornRegisterHomeScreen extends StatefulWidget {
  const NewBornRegisterHomeScreen({super.key});

  @override
  State<NewBornRegisterHomeScreen> createState() =>
      _NewBornRegisterHomeScreenState();
}

class _NewBornRegisterHomeScreenState extends State<NewBornRegisterHomeScreen> {
  final controller =
      Get.put<EncouterRegMatController>(EncouterRegMatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Obx(() {
            return Text(
              controller.title(),
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
                if (controller.currentScreen.value == 1) {
                  appRoute.pop();
                  return;
                }
                controller.currentScreen.value--;
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
                  labels: controller.stepsData,
                  currentStep: controller.currentScreen.value,
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
              15.height,
              Obx(() {
                return updateButtonNext(context);
              }),
              15.height,
              // 15.height,
              //  Obx(() => _offlineButton()),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Action Required"),
              content: Text(message),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  Widget getRightBody() {
    if (controller.currentScreen.value == 1) {
      return const NewBornRegisterScreen1();
    } else if (controller.currentScreen.value == 2) {
      return const NewBornRegisterScreen2();
    } else if (controller.currentScreen.value == 3) {
      return const NewBornRegisterScreen3();
    } else if (controller.currentScreen.value == 4) {
      return const NewBornRegisterScreen4();
    } else if (controller.currentScreen.value == 5) {
      return const NewBornRegisterScreen5();
    }
    return const NewBornRegisterScreen1();
  }

  Widget updateButtonNext(BuildContext context) {
    return AppElevatedButton(
      textColor: AppPalette.white,
      color: AppPalette.primary.primary400,
      height: 56,
      width: MediaQuery.of(context).size.width,
      radius: 8,
      text: controller.currentScreen.value == 5 ? 'Submit' : 'Next',
      onPressed: () async {
        if (controller.currentScreen.value == 1) {
          /* final isValid = controller.formKeyNewBornScreen1.currentState!.validate();
          if (!isValid) {
            return;
          }*/
        }

        if (controller.currentScreen.value == 2) {
          /* final isValid = controller.formKeyNewBornScreen2.currentState!.validate();
          if (!isValid) {
            return;
          }*/
        }

        if (controller.currentScreen.value == 3) {
          /*final isValid = controller.formKeyNewBornScreen3.currentState!.validate();
          if (!isValid) {
            return;
          }*/

          /*if (controller.selectDateOfBirth == null) {
            showAlertDialog('Date of Birth cannot be empty');
            return;
          }*/
        }

        if (controller.currentScreen.value == 4) {
          /*final isValid = controller.formKeyNewBornScreen4.currentState!.validate();
          if (!isValid) {
            return;
          }*/
        }
        if (controller.currentScreen.value == 5) {
          /*final isValid = controller.formKeyNewBornScreen5.currentState!.validate();
          if (!isValid) {
            return;
          }*/
        }

        controller.currentScreen.value++;

        if (controller.currentScreen.value == 6) {
          //controller.newMapData();
          controller.currentScreen.value--;
          showModalBottomSheet(
            backgroundColor: const Color(0xffFEFEFE),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            isScrollControlled: true,
            enableDrag: true,
            context: context,
            builder: (builder) {
              return Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const Wrap(
                  children: [
                    SuccessModal(),
                  ],
                ),
              );
            },
          );
          //submit data

          return;
        }
      },
    );
  }
}
