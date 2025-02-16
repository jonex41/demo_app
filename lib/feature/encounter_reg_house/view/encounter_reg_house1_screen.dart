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
class EncounterRegHouse1Screen extends GetView<EncouterRegHouseController> {
  const EncounterRegHouse1Screen({super.key});

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
                MyDropDownWidget(
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
                  title: "Name",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.nameController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Age(Years)",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.ageController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Counselling on Wash",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.consellingWashController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Counselling on Adolescent Health",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.counsellingAdolHealthController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Counselling on Family Planning",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.counsellingFamilyController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title:
                      "Counselling on Disease Prevention\n(Malaria/LLIN Use)",
                  showRequired: true,
                  textColor: Colors.black,
                  callBack: (value) {},
                  controller:
                      controller.counsellingDiseasePrevMalariaController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Counselling on Disease Prevention\n(Tuberculosis)",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.counsellingDiseasePreTuberController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Counselling on Disease Prevention\n(Hepatitis B)",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.counsellingDiseasePreHepatiController,
                  hint: '',
                ),
                15.height,
                MyInputTextWidget(
                  title: "Counselling on Disease Prevention\n(HIV/AIDS)",
                  textColor: Colors.black,
                  showRequired: true,
                  callBack: (value) {},
                  controller: controller.counsellingDiseasePreHivController,
                  hint: '',
                ),
                15.height,
                MyDropDownWidget(
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
                40.height,
                AppElevatedButton(
                  text: "Next",
                  width: context.width,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
