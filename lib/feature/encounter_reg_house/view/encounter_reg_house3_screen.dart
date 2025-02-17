import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/dropdown_text.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class EncounterRegHouse3Screen extends GetView<EncouterRegHouseController> {
  const EncounterRegHouse3Screen({super.key});

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
                      "Encounter Register\nHousehold",
                      style: context.theme.appTextTheme.titleSmall24.copyWith(
                          color: AppPalette.black, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                15.height,
                _header2(context, "Death of Pregnant Women/Mothers"),
                15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile:
                      "Since your Last Visit, Did Any Woman Die in This Household During These Periods?",
                  children: controller.yesNoList,
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select your answer",
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
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "If Yes, Select The Cause",
                  children: controller.yesNoList,
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select your answer",
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
                  title: "Name",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Age",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Date of Death",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Where Did The Death Occur?",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile:
                      "Has The Pregnant Woman/Mother’s Death Being Reported?",
                  children: controller.yesNoList,
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select your answer",
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
                _header2(context, "Death of Newborn (0-28 Days)"),
                15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile:
                      "Since your Last Visit, Did Any Newborn Die in This Household?",
                  children: controller.yesNoList,
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select your answer",
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
                  title: "Name",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Age (Month)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Date of Death ",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Was The Child Sick?",
                  children: controller.yesNoList,
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select your answer",
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
                  title: "What is The Cause of Death (If Known)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.houseNoController,
                  hint: '',
                ),
                15.height,
                // 15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Where Did Death Occur?",
                  children: controller.yesNoList,
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select your answer",
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
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Was The Death Reported?",
                  children: controller.yesNoList,
                  //  hintText: controller.selectedDate.value,
                  isEnabled: false,
                  hintText: "Select your answer",
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
                    appRoute.push(const EncounterRegHouse4Route());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _header(BuildContext context, String s) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          s,
          style: context.theme.appTextTheme.bodySmall14.copyWith(
              color: const Color(0xffAAA9A9), fontWeight: FontWeight.w800),
        ),
        10.width,
        Container(
          color: const Color(0xffD5D5D5),
          width: context.width / 2,
          height: 1.5,
        )
      ],
    );
  }

  _header2(BuildContext context, String s) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            s,
            style: context.theme.appTextTheme.bodySmall14.copyWith(
                color: const Color(0xffAAA9A9), fontWeight: FontWeight.w800),
          ),
        ),
        10.width,
        Expanded(
          flex: 1,
          child: Container(
            color: const Color(0xffD5D5D5),
            height: 1.5,
          ),
        )
      ],
    );
  }
}
