import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:demo_app/feature/encounter_reg_house/widget/search_item.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../component/search_field.dart';

@RoutePage()
class EncouterRegHouseRecordDetailsScreen
    extends GetView<EncouterRegHouseController> {
  const EncouterRegHouseRecordDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Hauwa Abdullahi Sani",
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              20.height,
              _singleText(context, "State of Visit", "01-08-2025"),
              20.height,
              Row(
                // crossAxisAlignment: ,
                children: [
                  _singleText(context, "House No", "CHIPS/260102/01/01"),
                  10.width,
                  _singleText(context, "Household No", "CHIPS/260102/01/01002"),
                ],
              ),
              20.height,
              _singleText(
                  context, "Date Registered by CHIPS Agent", "01-08-2025"),
              20.height,
              _singleText(context, "Name", "James Shaylah Hauwa"),
              20.height,
              _singleText(context, "Age", "30 Years"),
              20.height,
              _singleText(
                  context, "Counselling on Wash", "Counselling on Wash"),
              20.height,
              _singleText(context, "Counselling on Adolescent Health",
                  "Counselling on Adolescent Health"),
              20.height,
              _singleText(context, "Counselling on Family Plannng",
                  "Counselling on Family Plannng"),
              20.height,
              _singleText(
                  context,
                  "Counselling on Disease Prevention (Malaria/LLIN Use)",
                  "Counselling on Disease Prevention (Malaria/LLIN Use)"),
              20.height,
              _singleText(
                  context,
                  "Counselling on Disease Prevention (Tuberculosis)",
                  "Counselling on Disease Prevention (Tuberculosis)"),
              20.height,
              _singleText(
                  context,
                  "Counselling on Disease Prevention (Hepatitis B)",
                  "Counselling on Disease Prevention (Hepatitis B)"),
              20.height,
              _singleText(context, "First Aid Administered", "Yes"),
              20.height,
              _singleText(context, "Sick Adolescent", "Yes"),
              20.height,
              _singleText(context, "Sick Adult", "Yes"),
              20.height,
              _singleText(context, "Family Planning", "No"),
              20.height,
              _singleText(context, "Disease Prevention", "No"),
              20.height,
              _singleText(context, "Major Injuries", "No"),
              20.height,
              _singleText(context, "Skin Rash with Fever (Measles)", "No"),
              20.height,
              _singleText(context, "Stiff Neck with Fever (Meningitis)", "No"),
              20.height,
              _singleText(
                  context,
                  "Sudden Weakness of the Limbs (Acute Flaccid Paralysis)",
                  "No"),
              20.height,
              _singleText(
                  context, "Bleeding from Orifices e.g nose, eyes", "No"),
              20.height,
              _singleText(context, "Watery Stool with Blood (Dysentery)", "No"),
              20.height,
              _singleText(
                  context,
                  "Fever Followed by Rash on Palm, Soles & Palm (Monkey Pox)",
                  "NO"),
              20.height,
              _singleText(
                  context,
                  "Light or Reddish Skin Lesions with Loss of Sensation (Leprosy)",
                  "No"),
              20.height,
              _header2(context, "Death of Pregnant Women/Mothers"),
              20.height,
              _singleText(
                  context,
                  "Since your Last Visit, Did Any Woman Die in This Household During These Periods?",
                  "Yes"),
              20.height,
              _singleText(context, "If Yes, Select The Cause", "Pregnancy"),
              20.height,
              _singleText(context, "Name", "Yes"),
              20.height,
              _singleText(context, "Age", "30Years"),
              20.height,
              _singleText(context, "Date of Death", "NO"),
              20.height,
              _singleText(context, "Where Did The Death Occur?", "Home"),
              20.height,
              _singleText(
                  context,
                  "Has The Pregnant Woman/Mother’s Death Being Reported?",
                  "Yes"),
              20.height,
              _header2(context, "Death of Newborn (0-28 Days)"),
              20.height,
              _singleText(
                  context,
                  "Since your Last Visit, Did Any Newborn Die in This Household?",
                  "Yes"),
              20.height,
              _singleText(context, "Name", "Aguda John"),
              20.height,
              _singleText(context, "Age (Month)", "30 Years"),
              20.height,
              _singleText(context, "Date of Death", "01-08-2023"),
              20.height,
              _singleText(context, "Was The Child Sick?", "Yes"),
              20.height,
              _singleText(
                  context, "What is The Cause of Death (If Known)", "Nil"),
              20.height,
              _singleText(context, "Where Did The Death Occur?", "Home"),
              20.height,
              _singleText(context, "Was The Death Reported?", "Yes"),
              20.height,
              _header2(context, "Death of Children Under - 5 Years"),
              20.height,
              _singleText(
                  context,
                  "Since your Last Visit, Did Any Child Under-5 Die in This Household?",
                  "Yes"),
              20.height,
              _singleText(context, "Name", "Ajayi Johnson"),
              20.height,
              _singleText(context, "Age (Month)", "30 Years"),
              20.height,
              _singleText(context, "Date of Death", "01-08-2023"),
              20.height,
              _singleText(context, "Was The Child Sick?", "Yes"),
              20.height,
              _singleText(
                  context, "What is The Cause of Death (If Known)", "Nil"),
              20.height,
              _singleText(context, "Where Did The Death Occur?", "Home"),
              20.height,
              _singleText(context, "Was The Death Reported?", "Yes"),
              20.height,
            ],
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

  Widget _singleText(BuildContext context, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.theme.appTextTheme.labelLarge12.copyWith(
              color: const Color(0xff141619), fontWeight: FontWeight.w500),
        ),
        Text(
          subtitle,
          style: context.theme.appTextTheme.labelLarge12.copyWith(
              color: const Color(0xff899197), fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
