import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
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
class OfflineForm1Screen extends GetView<OfflineController> {
  const OfflineForm1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Enumerator Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
                  "Enumerator Form",
                  style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      color: AppPalette.black, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            15.height,
            _stepperHorizontal(),
            15.height,
            _buildSection("Enumerator Information", [
              _buildRow(
                  "Name of Enumerator",
                  controller.listMap[controller.selectedIndex]["enumerator"]
                          ["name"]
                      .toString()),
              Row(
                children: [
                  _buildRow(
                      "Phone Number",
                      controller.listMap[controller.selectedIndex]["enumerator"]
                              ["phoneNumber"]
                          .toString()),
                  20.width,
                  _buildRow(
                      "Team Code",
                      controller.listMap[controller.selectedIndex]["enumerator"]
                              ["teamCode"]
                          .toString()),
                ],
              ),
            ]),
            _buildSection("Settlement Demographics", [
              Row(
                children: [
                  _buildRow(
                      "State",
                      controller.listMap[controller.selectedIndex]["settlement"]
                              ["state"]
                          .toString()),
                  20.width,
                  _buildRow(
                      "LGA",
                      controller.listMap[controller.selectedIndex]["settlement"]
                              ["lga"]
                          .toString()),
                ],
              ),
              Row(
                children: [
                  _buildRow(
                      "Ward",
                      controller.listMap[controller.selectedIndex]["settlement"]
                              ["ward"]
                          .toString()),
                  20.width,
                  _buildRow(
                      "House Number",
                      controller.listMap[controller.selectedIndex]["household"]
                              ["houseNumber"]
                          .toString()),
                ],
              ),
              _buildRow(
                  "Settlement",
                  controller.listMap[controller.selectedIndex]["settlement"]
                          ["settlement"]
                      .toString()),
            ]),
            _buildSection("Enumerator Introduction", [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Good day, my name is ......................... I am here on behalf of the National Primary Health Care Development Agency (NPHCDA) and State Primary Health Care to ask you questions about the immunization status of children and pregnant women in your household. The information gathered will be used to improve the immunization program. All information you provide will remain confidential. ",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              5.height,
              _buildRow("At this time, do you want me to proceed?", "Yes"),
            ]),
            _buildSection("Caregiver’s Profile", [
              _buildRow(
                  "Head of Household Name",
                  controller.listMap[controller.selectedIndex]
                          ["headOfHousehold"]["name"]
                      .toString()),
              _buildRow(
                  "Head of Household Phone Number",
                  controller.listMap[controller.selectedIndex]
                          ["headOfHousehold"]["phoneNumber"]
                      .toString()),
              ...controller.getMotherDetails(controller.selectedIndex).map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildRow("Mother’s Name", e["name"].toString()),
                    _buildRow(
                        "Mother’s Phone Number", e["phoneNumber"].toString()),
                    _buildRow(
                        "Is the mother pregnant?", e["isPregnant"].toString()),
                    _buildRow("How many months pregnant is the woman?",
                        e["monthsPregnant"].toString()),
                    _buildRow(
                        "How many doses of TT/Td vaccine has the woman taken?",
                        e["ttTdDoses"].toString()),
                    _buildRow(
                        "How many times has the woman visited the health facility for ANC?",
                        e["ancVisits"].toString()),
                    _buildRow(
                        "How many under 5 children does this mother have?",
                        e["numberOfChildrenUnder5"].toString()),
                    ...controller
                        .getMotherChidrenDetails(e["children"])
                        .map((e) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildRow("Name of Child", e["name"].toString()),
                            _buildRow(
                                "Date of Birth", e["dateOfBirth"].toString()),
                            _buildRow("Age", e["age"].toString()),
                            _buildRow(
                                "Gender of Child", e["gender"].toString()),
                            _buildRow("Child has taken vaccination",
                                e["hasVaccinationCard"].toString()),
                            _buildRow(
                                "Name Of Health care Facility For Vaccination",
                                e["nameOfHealthcareFacilityForVaccination"]
                                    .toString()),
                            // Text("Number of Antigens Recieved")
                            _buildRow("Number of Antigens Recieved",
                                e["antigensReceived"].toString()),
                            _buildRow("Health Facility Visits",
                                e["healthFacilityVisits"].toString()),
                            _buildRow("Last Vaccination Site",
                                e["lastVaccinationSite"].toString()),
                          ]);
                    }),
                  ],
                );
              }),
            ]),
            30.height,
            AppElevatedButton(
              text: "Next",
              width: context.width(),
              onPressed: () {
                appRoute.push(const OfflineForm2Route());
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xffF9FAFB),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          ...children,
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          10.height,
          Text(value),
        ],
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
}
