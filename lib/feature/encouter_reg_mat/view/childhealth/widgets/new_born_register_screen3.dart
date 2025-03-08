import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class NewBornRegisterScreen3 extends StatefulWidget {
  const NewBornRegisterScreen3({super.key});

  @override
  State<NewBornRegisterScreen3> createState() => _NewBornRegisterScreen3State();
}

class _NewBornRegisterScreen3State extends State<NewBornRegisterScreen3> {
  final controller =
      Get.put<EncouterRegMatController>(EncouterRegMatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKeyNewBornScreen3,
      child: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppTextFieldHeader(
                        title: 'Recent Growth Monitoring Session Attended?'),
                    5.height,
                    AncDropDownButton(
                      hint: 'Select an option',
                      value: controller
                          .selectedRecentGrowthMonitoringAttended.value,
                      items: controller.recentGrowthMonitoringAttended,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Select an Option';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        controller.selectedRecentGrowthMonitoringAttended
                            .value = value;
                      },
                    ),
                    18.height,
                    const AppTextFieldHeader(
                        title: 'Most Recent Nutritional Services Received?'),
                    5.height,
                    AncDropDownButton(
                      hint: 'Select an option',
                      value: controller
                          .selectedMostRecentNutritionalReceived.value,
                      items: controller.mostRecentNutritionalReceived,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Select an Option';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        controller.selectedMostRecentNutritionalReceived.value =
                            value;
                      },
                    ),
                    18.height,
                    const AppTextFieldHeader(title: 'Caregiver counselled on:'),
                    5.height,
                    Obx(() {
                      return MultiSelectDialogField(
                        title: const Text("You can select more than one option",
                            style: TextStyle(fontSize: 13)),
                        buttonIcon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: AppPalette.grey.gray350,
                        ),
                        itemsTextStyle: const TextStyle(
                          fontSize: 13,
                        ),
                        selectedItemsTextStyle: const TextStyle(
                          fontSize: 13,
                        ),
                        decoration: BoxDecoration(
                          //  color: AppPalette.grey.gray300,
                          border: Border.all(
                            color: AppPalette.grey.gray300,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        items: controller.selectCareGiverCounselledOn
                            .map((e) => MultiSelectItem(
                                  e,
                                  e,
                                ))
                            .toList(),
                        listType: MultiSelectListType.LIST,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onConfirm: (values) {
                          controller.selectedCareGiverCounselledOn.value =
                              values;

                          debugPrint(
                              'selectedCareGiverCounselledOn: ${controller.selectedCareGiverCounselledOn}');
                        },
                      );
                    }),
                    18.height,
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
