import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/offline/provider/offline_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class OfflineForm2Screen extends GetView<OfflineController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text("Immunization Status Form")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
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
                    "Immunization Status Form",
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              15.height,
              _stepperHorizontal(),
              15.height,
              _buildSection("U5 Child Profile and Immunization Status"),
              buildQuestion(
                  "Are there children under 5 years in the household?",
                  controller.getValueMap(controller.selectedIndex, "IEV019")),
              buildQuestion("Date of Birth",
                  controller.getValueMap(controller.selectedIndex, "IEV021")),
              buildQuestion("Age Category",
                  controller.getValueMap(controller.selectedIndex, "IEV022")),
              buildQuestion("Name of Child",
                  controller.getValueMap(controller.selectedIndex, "IEV020")),
              buildQuestion("Gender",
                  controller.getValueMap(controller.selectedIndex, "IEV023")),
              buildQuestion("Does the child have a vaccination card?",
                  controller.getValueMap(controller.selectedIndex, "IEV024")),
              if (controller.getValueMap(controller.selectedIndex, "IEV024") ==
                  "Yes")
                ...controller
                    .getValueAntigenMap(controller.selectedIndex)
                    .map((e) => buildQuestion(e["name"], e["response"])),
              buildQuestion("Number of ANC visits made to the health facility",
                  controller.getValueMap(controller.selectedIndex, "IEV026")),
              buildQuestion("If Yes, select received antigens",
                  controller.getValueMap(controller.selectedIndex, "IEV025")),
              buildQuestion("Site of last vaccination",
                  controller.getValueMap(controller.selectedIndex, "IEV027")),
              _buildSection("Women of Childbearing Age (WCBA) Profile"),
              buildQuestion(
                  "Are there pregnant women in the household?", "Yes"),
              buildQuestion("Number of pregnant women in the household",
                  controller.getValueMap(controller.selectedIndex, "IEV028")),
              Row(
                children: [
                  buildQuestion(
                      "Name",
                      controller.getValueMap(
                          controller.selectedIndex, "IEV029")),
                ],
              ),
              buildQuestion("Has the woman taken T.T1 vaccine?", "Yes"),
              buildQuestion("If yes, what doses were taken?",
                  controller.getValueMap(controller.selectedIndex, "IEV031")),

              /*     Row(
                children: [
                  buildQuestion("Age", "27 years"),
                  20.width,
                  buildQuestion("Month Pregnant", "4 months"),
                ],
              ),
              buildQuestion("Has the woman taken T.T1 vaccine?", "Yes"),
              buildQuestion("If yes, what doses were taken?", "T1"),
              buildQuestion("Has the woman commenced ANC visits?", "Yes"),
              buildQuestion(
                  "Number of ANC visits made to the health facility", controller.getValueMap(controller.selectedIndex, "")),
              buildQuestion("Expected Date of Delivery (EDD)", "July 2025"), */
              30.height,
              if (!controller.isOnline.value)
                AppElevatedButton(
                  text: "Submit Record",
                  width: context.width(),
                  onPressed: () {
                    controller.submitDataOnline(context);
                    //  appRoute.push(const OfflineForm2Route());
                  },
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepperHorizontal() {
    var currentStep = 2;
    //var totalSteps = 0;
    final stepsData = [
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
        // activeColor: StepperColors.red500,
        maxLineLabel: 2,
        // inactiveColor: StepperColors.ink200s
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xffF9FAFB),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget buildQuestion(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 10.0),
          Text(answer,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff899197))),
        ],
      ),
    );
  }
}
