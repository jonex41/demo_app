import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:progress_bar_steppers/stepper_style.dart';
import 'package:progress_bar_steppers/steppers_widget.dart';

@RoutePage()
class ChipsReferralFormScreen extends StatefulWidget {
  const ChipsReferralFormScreen({super.key});

  @override
  _ChipsReferralFormScreenState createState() =>
      _ChipsReferralFormScreenState();
}

class _ChipsReferralFormScreenState extends State<ChipsReferralFormScreen> {
  int _currentStep = 0;
  final Map<String, bool> _reasonsForReferral = {
    "New sick born": false,
    "Immunization": false,
    "Severe acute malnutrition (Red MUAC and/or oedema).": false,
    "Fever (RDT Negative)": false,
    "Malaria (Not responding to treatment)": false,
    "Diarrhea (Not responding to treatment)": false,
    "Chest in-drawing": false,
    "Convulsion": false,
    "Vomiting": false,
    "Unable to drink/breastfeed": false,
    "Unusually sleepy or unconscious": false,
    "Blood in stool": false,
    "Fever lasting more than 7 days": false,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
              Expanded(child: _buildReferralForm()),
              40.height,
              AppElevatedButton(
                text: "Next",
                width: context.width(),
                onPressed: () {
                  appRoute.push(const ChipsReferralForm3Route());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Stepper for progress tracking
  Widget _buildStepper() {
    return Stepper(
      currentStep: _currentStep,
      onStepTapped: (step) => setState(() => _currentStep = step),
      controlsBuilder: (context, details) =>
          const SizedBox(), // Hides Next/Back buttons
      steps: List.generate(
        5,
        (index) => Step(
          title: const SizedBox.shrink(),
          content: const SizedBox.shrink(),
          isActive: index <= _currentStep,
          state: index == _currentStep ? StepState.editing : StepState.complete,
        ),
      ),
    );
  }

  /// Referral form UI
  Widget _buildReferralForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Reason for Referral (✓)"),
          _buildCheckboxList("CHILDREN 0 - 59 MONTHS", [
            "New sick born",
            "Immunization",
            "Severe acute malnutrition (Red MUAC and/or oedema).",
            "Fever (RDT Negative)",
            "Malaria (Not responding to treatment)",
            "Diarrhea (Not responding to treatment)",
          ]),
          _buildCheckboxList("Danger signs", [
            "Chest in-drawing",
            "Convulsion",
            "Vomiting",
            "Unable to drink/breastfeed",
            "Unusually sleepy or unconscious",
            "Blood in stool",
            "Fever lasting more than 7 days",
            "Diarrhoea lasting more than 14 days",
            "Cough lasting more than 14 days"
          ]),
        ],
      ),
    );
  }

  /// Builds a section title
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

  /// Builds a checkbox list
  Widget _buildCheckboxList(String heading, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          heading,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  /// Builds a single checkbox item
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
