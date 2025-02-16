import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class ChecklistScreen1 extends StatefulWidget {
  const ChecklistScreen1({super.key});

  @override
  State<ChecklistScreen1> createState() => _ChecklistScreen1State();
}

class _ChecklistScreen1State extends State<ChecklistScreen1> {
  final checklistController =
      Get.put<ChecklistController>(ChecklistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: checklistController.formKeyScreen1,
        child: Container(
          color: AppPalette.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.height,
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AppTextFieldHeader(title: 'Chip Agent Unique ID'),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          } else {
                            return null;
                          }
                        },
                        decoration: inputDecoration().copyWith(
                            hintText: 'Enter your answer',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w400),
                        controller: checklistController.chipAgentUniqueId,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Chip Agent Full Name'),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          } else {
                            return null;
                          }
                        },
                        decoration: inputDecoration().copyWith(
                            hintText: 'Enter your answer',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w400),
                        controller: checklistController.chipAgentFullName,
                      ),
                      29.height,
                      const AppTextFieldHeader(
                          title: 'Date registered  by Chips Agent'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          final DateTime now = DateTime.now();
                          var picked = await showDatePicker(
                            context: context,
                            initialDate:
                                checklistController.dateRegisteredChipAgent ??
                                    DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: now,
                            //lastDate: DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: AppPalette.primary.primary400,
                                  colorScheme: ColorScheme.light(
                                    primary: AppPalette.primary.primary400,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (picked != null &&
                              picked !=
                                  checklistController.dateRegisteredChipAgent) {
                            var formattedDate =
                                DateFormat('yyyy-MM-dd').format(picked);
                            checklistController
                                .setDateRegisteredChipAgent(picked);
                            /*  widget.bankStatementController
                                                        .selectDurationEndDate = formattedDate; */

                            checklistController
                                .setSelectedDateRegisteredChipAgent(
                                    formattedDate);
                          }
                        },
                        child: Obx(() {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 8, top: 10, bottom: 10, right: 8),
                            decoration: BoxDecoration(
                              color: AppPalette.transparent,
                              border: Border.all(
                                  width: 1.5, color: AppPalette.grey.gray300),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      checklistController
                                                  .selectDateRegisteredChipAgent !=
                                              null
                                          ? checklistController
                                              .selectDateRegisteredChipAgent
                                              .toString()
                                          : 'Select Date',
                                      style: context
                                          .theme.appTextTheme.bodyMedium16
                                          .copyWith(
                                        fontSize: 13,
                                        color: AppPalette.grey.gray600,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'State'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select a State',
                          value: checklistController.stateValue.value,
                          items: NigerianStatesAndLGA.allStates,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select State';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.lgaValue.value =
                                'Select a Local Government Area';
                            checklistController.statesLga.value?.clear();
                            checklistController.statesLga.value
                                ?.add(checklistController.lgaValue.value);
                            checklistController.statesLga.value?.addAll(
                                NigerianStatesAndLGA.getStateLGAs(value));

                            checklistController.setNgState(value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'LGA'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select a Local Government Area',
                          value: checklistController.lgaValue.value,
                          items: checklistController.statesLga.value,
                          validator: (value) {
                            if (value == 'Select a Local Government Area' ||
                                value!.isEmpty) {
                              return 'Please Select Local Government Area';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.setNgLGA(value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'Ward'),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.OTHER,
                        isValidationRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          } else {
                            return null;
                          }
                        },
                        decoration: inputDecoration().copyWith(
                            hintText: 'Enter your answer',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w400),
                        controller: checklistController.ward,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Community'),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.OTHER,
                        isValidationRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          } else {
                            return null;
                          }
                        },
                        decoration: inputDecoration().copyWith(
                            hintText: 'Enter your answer',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w400),
                        controller: checklistController.community,
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
