import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/dropdown_text.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class MaternalReg4Screen extends StatefulWidget {
  const MaternalReg4Screen({super.key});

  @override
  State<MaternalReg4Screen> createState() => _IEVDataScreen1State();
}

class _IEVDataScreen1State extends State<MaternalReg4Screen> {
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
                        "ETS Usage",
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.appTextTheme.bodyLarge18.copyWith(
                            color: AppPalette.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  30.height,
                     _stepperHorizontal(),
                  15.height,
                  MyDropDownWidget(
                    onChange: (value) {},
                    titile: "Emergency Transport Service (ETS) Used",
                    children: const ["Yes", "No"],
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
                      "Live Birth",
                      "Miscarriage",
                      "Still Birth",
                      "Maternal Death"
                    ],
                    "Pregnancy Outcome",
                    (value) {
                      // controller.headacheGen.clear();
                      // controller.headacheGen = value;
                    },
                    (value) {
                      return null;
                    },
                  ),
                  15.height,
                  const Text("Postnatal Visits"),
                  Row(
                    children: [
                      Expanded(
                        child: MyInputTextWidget(
                          title: "Week 1",
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
                          title: "Week 2",
                          textColor: Colors.black,
                          showRequired: true,
                          callBack: (value) {},
                          controller: TextEditingController(),
                          hint: '',
                        ),
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    children: [
                      Expanded(
                        child: MyInputTextWidget(
                          title: "Week 3",
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
                          title: "Week 4",
                          textColor: Colors.black,
                          showRequired: true,
                          callBack: (value) {},
                          controller: TextEditingController(),
                          hint: '',
                        ),
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    children: [
                      Expanded(
                        child: MyInputTextWidget(
                          title: "Week 5",
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
                          title: "Week 6",
                          textColor: Colors.black,
                          showRequired: true,
                          callBack: (value) {},
                          controller: TextEditingController(),
                          hint: '',
                        ),
                      ),
                    ],
                  ),
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
                        appRoute.push(const MaternalReg5Route());
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
            // color: const Color(0xff027D52),
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
  
  Widget _stepperHorizontal() {
    var currentStep = 4;
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
