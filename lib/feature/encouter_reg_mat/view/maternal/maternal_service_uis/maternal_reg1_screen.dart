import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class MaternalReg1Screen extends StatefulWidget {
  const MaternalReg1Screen({super.key});

  @override
  State<MaternalReg1Screen> createState() => _IEVDataScreen1State();
}

class _IEVDataScreen1State extends State<MaternalReg1Screen> {
  final controller =
      Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKeyScreen1,
          child: Container(
            color: AppPalette.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        "Pregnant Women Registered",
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.appTextTheme.bodyLarge18.copyWith(
                            color: AppPalette.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  15.height,
                  _stepperHorizontal(),
                  15.height,
                  MyInputTextWidget(
                    title: "Settlement",
                    textColor: Colors.black,
                    showRequired: true,
                    callBack: (value) {},
                    controller: TextEditingController(),
                    hint: '',
                  ),
                  18.height,
                  Row(
                    children: [
                      Expanded(
                        child: MyInputTextWidget(
                          title: "House No",
                          textColor: Colors.black,
                          showRequired: true,
                          callBack: (value) {},
                          controller: TextEditingController(),
                          hint: '',
                        ),
                      ),
                      10.width,
                      Expanded(
                        child: MyInputTextWidget(
                          title: "Household No",
                          textColor: Colors.black,
                          showRequired: true,
                          callBack: (value) {},
                          controller: TextEditingController(),
                          hint: '',
                        ),
                      ),
                    ],
                  ),
                  18.height,
                  MyInputTextWidget(
                    title: "Pregnant Woman's Name",
                    textColor: Colors.black,
                    showRequired: true,
                    callBack: (value) {},
                    controller: TextEditingController(),
                    hint: '',
                  ),
                  18.height,
                  MyInputTextWidget(
                    title: "Phone Number",
                    textColor: Colors.black,
                    showRequired: true,
                    callBack: (value) {},
                    controller: TextEditingController(),
                    hint: '',
                  ),
                  18.height,
                  MyInputTextWidget(
                    title: "Age",
                    textColor: Colors.black,
                    showRequired: true,
                    callBack: (value) {},
                    controller: TextEditingController(),
                    hint: '',
                  ),
                  18.height,
                  MyInputTextWidget(
                    title: "Date(Registered by CHIPS Agent)",
                    textColor: Colors.black,
                    showRequired: true,
                    callBack: (value) {},
                    controller: TextEditingController(),
                    hint: '12/02/2025',
                  ),
                  18.height,
                  MyInputTextWidget(
                    title: "Date(Expected Date of Delivery)",
                    textColor: Colors.black,
                    showRequired: true,
                    callBack: (value) {},
                    controller: TextEditingController(),
                    hint: '12/02/2025',
                  ),
                  18.height,
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppTextFieldHeader(
                                  title: 'Home Visits During Pregnancy'),
                              5.height,
                              AncDropDownButton(
                                hint: 'Select visit',
                                value: controller.stateValue.value,
                                items: const [
                                  "1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Select State';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          );
                        }),
                      ),
                      18.width,
                    ],
                  ),
                  //dynamic add datefield here
                  20.height,
                  Align(
                    alignment: Alignment.center,
                    child: AppElevatedButton(
                      width: double.infinity,
                      textColor: AppPalette.white,
                      color: AppPalette.primary.primary400,
                      height: 56,
                      text: 'Next',
                      onPressed: () {
                        appRoute.push(const MaternalReg2Route());
                        //controller.gotoHomeScreen(context);
                        //  controller.loginNetwork(context);
                      },
                      /*  textStyle: context.theme.appTextTheme.labelLarge12.copyWith(
                    color: AppPalette.white, fontWeight: FontWeight.w400), */
                    ),
                  ),
                  30.height,
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF9FAFB),
      ),
      child: Text(
        title,
        style: context.theme.appTextTheme.bodyMedium16.copyWith(
          fontSize: 15,
          color: AppPalette.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _stepperHorizontal() {
    var currentStep = 1;
    //var totalSteps = 0;
    final stepsData = [
      StepperData(
        label: '',
      ),
      StepperData(
        label: '',
      ),
      StepperData(
        label: '',
      ),
      StepperData(
        label: '',
      ),
      StepperData(
        label: '',
      ),
    ];
    return Steppers(
      direction: StepperDirection.horizontal,
      labels: stepsData,
      currentStep: currentStep,
      stepBarStyle: StepperStyle(
        activeColor: AppPalette.primary.primary400,
        maxLineLabel: 2,
        // inactiveColor: StepperColors.ink200s
      ),
    );
  }
}
