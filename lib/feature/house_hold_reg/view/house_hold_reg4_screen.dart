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
import 'package:demo_app/feature/house_hold_reg/provider/house_hold_reg_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class HouseHoldReg3Screen extends GetView<HouseHoldRegController> {
  const HouseHoldReg3Screen({super.key});

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
                _header2(context, "Household members registration"),
                15.height,
                MyInputTextWidget(
                  title: "Name",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: TextEditingController(),
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Relationship to House head ",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: TextEditingController(),
                  hint: '',
                ),
                15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Sex",
                  children: const ["Male", "Female"],
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
                  titile: "Age category",
                  children: const ["0 - 5 years", "6 years & above"],
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
                  title: "age",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: TextEditingController(),
                  hint: '',
                ),
                15.height,
                MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Educational qualification",
                  children: const [
                    "None",
                    "Primary school",
                    "Junior secondary",
                    "Senior secondary",
                    "Post - secondary",
                    "Koranic",
                    "Others"
                  ],
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
                  titile:
                      "Tick (✓) if any of the household members belong to the categories listed ",
                  children: const [
                    "",
                    "",
                  ],
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
                _myMultiPicker(
                  context,
                  [
                    "Children 0 - 23 months",
                    "Children 24 - 59 months",
                    "Women 20 - 49 years"
                  ],
                  "Tick (✓) if any of the household members belong to the categories listed ",
                  (value) {
                    controller.headacheGen.clear();
                    controller.headacheGen = value;
                  },
                  (value) {
                    return null;
                  },
                ),
                15.height,
                _myMultiPicker(
                  context,
                  ["Birth", "Death", "Migration"],
                  "Tick (✓) to provide updates on Births, Deaths and Migrations for the household",
                  (value) {
                    controller.headacheGen.clear();
                    controller.headacheGen = value;
                  },
                  (value) {
                    return null;
                  },
                ),
                15.height,
                MyInputTextWidget(
                  title: "Updated on birth",
                  showRequired: true,
                  maxLine: 4,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: TextEditingController(),
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Date",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: TextEditingController(),
                  hint: '',
                ),
                15.height,
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

  Widget _myMultiPicker(
      BuildContext context,
      List<String> list,
      String title,
      Function(List<String> value) onConfirm,
      String? Function(List<String>?)? validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.height,
        Text(
          title,
          style: context.theme.appTextTheme.bodyMedium16.copyWith(
            //s color: AppPalette.dark.dark50,
            fontWeight: FontWeight.w400,
          ),
        ),
        5.height,
        MultiSelectDialogField(
          validator: validator,
          buttonIcon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppPalette.grey.gray350,
          ),
          decoration: BoxDecoration(
            //  color: AppPalette.grey.gray300,
            border: Border.all(
              color: AppPalette.grey.gray300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          items: list
              .map((e) => MultiSelectItem(
                    e,
                    e,
                  ))
              .toList(),
          listType: MultiSelectListType.CHIP,
          onConfirm: onConfirm,
        ),
      ],
    );
  }
}
