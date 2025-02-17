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
class EncounterRegHouse2Screen extends GetView<EncouterRegHouseController> {
  const EncounterRegHouse2Screen({super.key});

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
                _header(context, "Referral"),
                20.height,
                /*   MyDropDownWidget(
                  onChange: (value) {},
                  titile: "Date of Visit",
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
                ), */
                15.height,
                MyInputTextWidget(
                  title: "Sick Adolescent",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.sickAdolescentController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Sick Adult",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.sickAdultController,
                  hint: '',
                ),
                15.height,
                15.height,
                MyInputTextWidget(
                  title: "Sick Elderly",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.sickkElderlyController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Family Planning",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.familyPlanningController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Disease Prevention",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.diseasePreventionController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Major Injuries",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.majorInjuriesController,
                  hint: '',
                ),
                15.height,
                _header2(context, "Community Surveillance"),
                15.height,
                MyInputTextWidget(
                  title: "Skin Rash with Fever (Measles)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.skinRashMeaslesController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Stiff Neck with Fever (Meningitis)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.stiffNeckFeverController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title:
                      "Sudden Weakness of the Limbs (Acute Flaccid Paralysis)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.suddenLimbAcuteController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Bleeding from Orifices e.g nose, eyes",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.bleedingOrificesController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Watery Stool with Blood (Dysentery)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.waterStoolController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title:
                      "Fever Followed by Rash on Palm, Soles & Palm (Monkey Pox)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.feverFollwRashController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title:
                      "Light or Reddish Skin Lesions with Loss of Sensation (Leprosy)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller: controller.lightRedSkinSnsController,
                  hint: '',
                ),
                15.height,

                /*   MyDropDownWidget(
                  onChange: (value) {},
                  titile: "First Aid Administered",
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
               */
                40.height,
                AppElevatedButton(
                  text: "Next",
                  width: context.width,
                  onPressed: () {
                    appRoute.push(const EncounterRegHouse3Route());
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
