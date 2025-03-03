import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/dropdown_text.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/chip_referral/provider/chip_referral_controller.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class ChipReferralForm1Screen extends GetView<ChipReferralController> {
  const ChipReferralForm1Screen({super.key});

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
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
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
                      "CHIPS referral form",
                      style: context.theme.appTextTheme.titleSmall24.copyWith(
                          color: AppPalette.black, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                15.height,
                _stepperHorizontal(),
                15.height,
                MyInputTextWidget(
                  title: "Name",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.nameController,
                  hint: '',
                ),
                15.height,
                15.height,
                MyInputTextWidget(
                  title: "CHIPS agent phone no.",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.chipsAgentPhoneNoController,
                  hint: '',
                ),
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Date",
                  children: const [],
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select Date",
                  showRequired: true,
                  validator: (value) {
                    return null;

                    /*  if (controller.selectedDate.value.isEmptyOrNull) {
                              return 'Field is required';
                            } else {
                              return null;
                            } */
                  },
                ),
                15.height,
                MyInputTextWidget(
                  title: "House No",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Household No",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.householdNoController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Name of Household head",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.nameController,
                  hint: '',
                ),
                15.height,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        const Color(0xffFEF6FF), // Background color (optional)
                    border: Border.all(
                      color: Colors.white, // White border color
                      width: 2.0, // Border width
                    ),
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                  ),
                  padding: const EdgeInsets.all(
                      16.0), // Optional padding inside the container
                  child: Text(
                    "Client Details",
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w800),
                  ),
                ),
                15.height,
                MyInputTextWidget(
                  title: "Client’s name",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.nameOfHouseHoldHeadController,
                  hint: '',
                ),
                Text(
                  "Last Name, First Name, Middle name",
                  style: context.theme.appTextTheme.labelLarge10.copyWith(
                      color: const Color(0xff767676),
                      fontWeight: FontWeight.w300),
                ),
                15.height,
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyInputTextWidget(
                        title: "Ward",
                        textColor: Colors.black,
                        showRequired: true,
                        callBack: (value) {},
                        controller: controller.wardController,
                        hint: '',
                      ),
                    ),
                    5.width,
                    Expanded(
                      child: MyInputTextWidget(
                        title: "Settlement",
                        textColor: Colors.black,
                        showRequired: true,
                        callBack: (value) {},
                        controller: controller.settlementController,
                        hint: '',
                      ),
                    ),
                  ],
                ),
                15.height,
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyInputTextWidget(
                        title: "Clients Age",
                        textColor: Colors.black,
                        showRequired: true,
                        callBack: (value) {},
                        controller: controller.clientAgeController,
                        hint: '',
                      ),
                    ),
                    5.width,
                    Expanded(
                      child: MyInputTextWidget(
                        title: "Phone no.",
                        textColor: Colors.black,
                        showRequired: true,
                        callBack: (value) {},
                        controller: controller.phoneNoController,
                        hint: '',
                      ),
                    ),
                  ],
                ),
                15.height,
                15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Sex M/F",
                  children: const [],
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,

                  showRequired: true,
                  validator: (value) {
                    return null;

                    /*  if (controller.selectedDate.value.isEmptyOrNull) {
                              return 'Field is required';
                            } else {
                              return null;
                            } */
                  },
                ),
                40.height,
                AppElevatedButton(
                  text: "Next",
                  width: context.width,
                  onPressed: () {
                    appRoute.push(const ChipsReferralFormRoute());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
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
