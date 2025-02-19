import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class ReferralForm4Screen extends StatefulWidget {
  const ReferralForm4Screen({super.key});

  @override
  _ReferralForm4ScreenState createState() => _ReferralForm4ScreenState();
}

class _ReferralForm4ScreenState extends State<ReferralForm4Screen> {
  final Map<String, bool> _reasonsForReferral = {
    "Sick school child (6 - 9 Years)": false,
    "Sick adolescent (10 - 19 Years)": false,
    "Sick adult": false,
    "Sick elderly": false,
    "HIV testing services (HTS)": false,
    "TB screening & testing": false,
    "Family planning": false,
  };

  final TextEditingController _otherReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
                    "CHIPS referral form",
                    style: context.theme.appTextTheme.titleSmall24.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              15.height,
              _stepperHorizontal(),
              15.height,
              _buildSectionTitle("Reason for Referral (✔)"),
              _buildCheckboxList("ADOLESCENT/ADULT/ELDERLY", [
                "Sick school child (6 - 9 Years)",
                "Sick adolescent (10 - 19 Years)",
              ]),
              _buildTwoColumnCheckbox(["Sick adult", "Sick elderly"]),
              _buildCheckboxList("", [
                "HIV testing services (HTS)",
                "TB screening & testing",
                "Family planning",
              ]),
              20.height,
              _buildOtherReasonInput(),
              40.height,
              AppElevatedButton(
                text: "Submit",
                width: context.width(),
                onPressed: () {
                  appRoute.popUntilRoot();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section title styling
  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: context.width(),
      decoration: BoxDecoration(
        color: const Color(0xffFEF6FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D2739)),
      ),
    );
  }

  /// Checkbox list for standard layout
  Widget _buildCheckboxList(String heading, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              heading,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: items.map((item) => _buildCheckbox(item)).toList(),
          ),
        ),
      ],
    );
  }

  /// Two-column layout for side-by-side checkboxes
  Widget _buildTwoColumnCheckbox(List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children:
            items.map((item) => Expanded(child: _buildCheckbox(item))).toList(),
      ),
    );
  }

  /// Checkbox item
  Widget _buildCheckbox(String title) {
    return CheckboxListTile(
      title: Text(title),
      value: _reasonsForReferral[title] ?? false,
      onChanged: (value) {
        setState(() {
          _reasonsForReferral[title] = value!;
        });
      },
    );
  }

  /// "Other reason" text input
  Widget _buildOtherReasonInput() {
    return MyInputTextWidget(
      title: "Others (describe)",
      textColor: Colors.black,
      showRequired: true,
      callBack: (value) {},
      controller: TextEditingController(),
      hint: '',
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
