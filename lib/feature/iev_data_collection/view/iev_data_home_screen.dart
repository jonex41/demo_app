import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_bindings.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:demo_app/feature/iev_data_collection/widgets/iev_data_screen1.dart';
import 'package:demo_app/feature/iev_data_collection/widgets/iev_data_screen2.dart';
import 'package:demo_app/feature/iev_data_collection/widgets/iev_data_screen3.dart';
import 'package:demo_app/feature/iev_data_collection/widgets/iev_data_screen4.dart';
import 'package:demo_app/feature/util/LocationHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class IEVDataHomeScreen extends StatefulWidget {
  const IEVDataHomeScreen({super.key});

  @override
  State<IEVDataHomeScreen> createState() => _IEVDataHomeScreenState();
}

class _IEVDataHomeScreenState extends State<IEVDataHomeScreen> {
  final controller =
      Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  void initState() {
    super.initState();
    setLocation();
  }

  void setLocation() async {
    controller.currentPosition.value =
        await LocationHandler.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool exitApp = await _showExitDialog(context);
          return exitApp; // Return true to exit, false to stay
        },
        child: Scaffold(
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
        ));
  }

  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit question"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), // Stay in the app
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Get.delete<IEVDataCollectionController>();
                  IEVDataCollectionBindings().dependencies();

                  return Navigator.of(context).pop(true);
                }, // Exit the app
                child: const Text("Yes"),
              ),
            ],
          ),
        ) ??
        false; // Default to false if dialog is dismissed
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
      return const IEVDataScreen1();
    } else if (controller.currentScreen.value == 2) {
      return const IEVDataScreen2();
    } else if (controller.currentScreen.value == 3) {
      return const IEVDataScreen3();
    } else if (controller.currentScreen.value == 4) {
      return const IEVDataScreen4();
    }
    return const IEVDataScreen1();
  }

  Widget updateButtonNext(BuildContext context) {
    if (controller.selectedProceed.value == 'No') {
      return AppElevatedButton(
        textColor: AppPalette.white,
        color: AppPalette.primary.primary400,
        height: 56,
        width: MediaQuery.of(context).size.width,
        radius: 8,
        text: 'Submit',
        onPressed: () async {
          if (controller.currentScreen.value == 2) {
            final isValid = controller.formKeyScreen2.currentState!.validate();
            if (!isValid) {
              return;
            }
          }

          if (await isNetworkAvailable()) {
            print("i am online");
            controller.submitData(context);
          } else {
            print("i am offline");
            controller.submitDataLocally(context);
          }

          return;
        },
      );
    } else {
      return AppElevatedButton(
        textColor: AppPalette.white,
        color: AppPalette.primary.primary400,
        height: 56,
        width: MediaQuery.of(context).size.width,
        radius: 8,
        text: controller.currentScreen.value == 4 ? 'Submit' : 'Next',
        onPressed: () async {
          if (controller.currentScreen.value == 1) {
            final isValid = controller.formKeyScreen1.currentState!.validate();
            if (!isValid) {
              return;
            }
          }

          if (controller.currentScreen.value == 2) {
            //controller.newMapData();
            final isValid = controller.formKeyScreen2.currentState!.validate();
            if (!isValid) {
              return;
            }
          }

          if (controller.currentScreen.value == 3) {
            //controller.newMapData();
            final isValid = controller.formKeyScreen3.currentState!.validate();
            if (!isValid) {
              return;
            }

            /*if (controller.selectDateOfBirth == null) {
            showAlertDialog('Date of Birth cannot be empty');
            return;
          }*/
          }

          if (controller.currentScreen.value == 4) {
            final isValid = controller.formKeyScreen4.currentState!.validate();
            if (!isValid) {
              return;
            }
          }

          controller.currentScreen.value++;

          if (controller.currentScreen.value == 5) {
            //controller.newMapData();
            controller.currentScreen.value--;
            if (await isNetworkAvailable()) {
              print("i am online");
              controller.submitData(context);
            } else {
              print("i am offline");
              controller.submitDataLocally(context);
            }

            return;
          }
        },
      );
    }
  }

  Widget _offlineButton() {
    return controller.currentScreen.value == 4
        ? Column(
            children: [
              AppElevatedButton(
                textColor: AppPalette.white,
                color: AppPalette.primary.primary400,
                height: 56,
                width: MediaQuery.of(context).size.width,
                radius: 8,
                text: 'Save Locally',
                onPressed: () {
                  controller.submitDataLocally(context);
                },
              ),
              15.height
            ],
          )
        : Container();
  }
}
