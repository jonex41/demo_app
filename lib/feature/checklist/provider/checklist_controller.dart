import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/feature/checklist/provider/checklist_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_bar_steppers/stepper_data.dart';

class ChecklistController extends GetxController {
  final chipAgentUniqueId = TextEditingController();
  final chipAgentFullName = TextEditingController();

  final settlement = TextEditingController();
  final houseNumber = TextEditingController();

  final formKeyScreen1 = GlobalKey<FormState>();
  final formKeyScreen2 = GlobalKey<FormState>();

  List<StepperData> stepsData = [
    StepperData(
      label: '',
    ),
    StepperData(
      label: '',
    ),
  ];
  final currentScreen = 1.obs;

  Future<void> gotoAddNewChecklistScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const AddNewChecklistRoute());
  }
}
