import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_bindings.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:demo_app/feature/offline/provider/offline_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
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
              _header("Number of under 5 children in the household"),
              15.height,
              ...controller
                  .getMotherChidrenDetails(
                      controller.listMap[controller.selectedIndex]["children"])
                  .map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildQuestion("First name and surname of child",
                        e["name"].toString()),
                    buildQuestion("Do you know the date of birth of the child?",
                        e["dateOfBirth"].toString()),

                    buildQuestion(
                        "What is the age of child? (if DOB is uncertain)",
                        e["age"].toString()),
                    buildQuestion(
                        "What is the sex of the child?", e["sex"].toString()),
                    buildQuestion(
                        "Has the child ever received the polio vaccine in the past?",
                        e["receivedPolioVaccineBefore"].toString()),
                    buildQuestion(
                        "Has the child ever received any routine vaccines in the past?",
                        e["receivedRoutineVaccineBefore"].toString()),
                    buildQuestion("Does the child have an RI vaccination card?",
                        e["hasRIVaccinationCard"].toString()),
                    buildQuestion("Select the antigens the child has received",
                        e["antigensReceived"].toString()),
                    buildQuestion(
                        "How many visits has the child had to the Health facility for vaccinations? ",
                        e["howManyVisitsHasChildHad"].toString()),
                    buildQuestion(
                        "On which part of the body did the child take the last vaccine?",
                        e["kkkkkk"].toString()),
                          buildQuestion(
                        "The last vaccine site?",
                        e["lastVaccinationSite"].toString()),
                    buildQuestion(
                        "What is the name of the primary caregiver of this child?",
                        e["primaryCareGiverName"].toString()),
                    buildQuestion(
                        "Relationship of the primary caregiver to the child",
                        e["relationshipOfCaregiverToChild"].toString()),
                    buildQuestion("Phone number of primary caregiver",
                        e["careGiverPhoneNumber"].toString()),
                    // buildQuestion("firstName", "Yes"),
                  ],
                );
              }).toList(),
              30.height,
              AppElevatedButton(
                text: "Next",
                width: context.width,
                onPressed: () {
                  //controller.submitDataOnline(context);
                  appRoute.push(const OfflineForm3Route());
                },
              ),
              /*  if (controller.isOnline.value)
                AppElevatedButton(
                  text: "Edit Record",
                  width: context.width,
                  onPressed: () {
                    IEVDataCollectionBindings().dependencies();
                    Get.find<IEVDataCollectionController>().isEditing.value =
                        true;

                         Get.find<IEVDataCollectionController>().selectedMap =
                       controller.listMap[controller.selectedIndex]  ;

                    appRoute.push(const IEVDataHomeRoute());
                  },
                ) */
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
      StepperData(
        label: '',
      ),
    ];
    return Steppers(
      direction: StepperDirection.horizontal,
      labels: stepsData,
      currentStep: currentStep,
      stepBarStyle: StepperStyle(
        activeColor: const Color(0xff14A673),
        // activeColor: StepperColors.red500,
        maxLineLabel: 2,
        // inactiveColor: StepperColors.ink200s
      ),
    );
  }

  Widget _header(String text) {
    return Container(
      color: const Color(0xffEEFFF9),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff14A673)),
        ),
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
