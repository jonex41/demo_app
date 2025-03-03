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
class ChipsReferralForm3Screen extends StatefulWidget {
  const ChipsReferralForm3Screen({super.key});

  @override
  _ChipsReferralForm3ScreenState createState() =>
      _ChipsReferralForm3ScreenState();
}

class _ChipsReferralForm3ScreenState extends State<ChipsReferralForm3Screen> {
  int _currentStep = 2; // Assuming step 2 is active
  final Map<String, bool> _reasonsForReferral = {
    "Antenatal care": false,
    "Delivery": false,
    "Postnatal care": false,
    "Chest in-drawing": false,
    "Convulsion": false,
    "Vomiting": false,
    "Unable to drink/breastfeed": false,
    "Unusually sleepy or unconscious": false,
    "Blood in stool": false,
    "Fever lasting more than 7 days": false,
    "Diarrhoea lasting more than 14 days": false,
    "Cough lasting more than 14 days": false,
  };

  final TextEditingController _otherReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  appRoute.push(const ReferralForm4Route());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Stepper progress indicator
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
          _buildSectionTitle("Reason for Referral (✔)"),
          _buildCheckboxList("PREGNANT/POSTPARTUM", [
            "Antenatal care",
            "Delivery",
            "Postnatal care",
          ]),
          20.height,
          _buildOtherReasonInput(),
          _buildCheckboxList("Danger signs", [
            "Chest in-drawing",
            "Convulsion",
            "Vomiting",
            "Unable to drink/breastfeed",
            "Unusually sleepy or unconscious",
            "Blood in stool",
            "Fever lasting more than 7 days",
            "Diarrhoea lasting more than 14 days",
            "Cough lasting more than 14 days",
          ]),
        ],
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

  /// Checkbox list for different sections
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
    var currentStep = 1;
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
