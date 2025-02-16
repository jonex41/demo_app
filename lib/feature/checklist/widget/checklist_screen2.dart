import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class ChecklistScreen2 extends StatefulWidget {
  const ChecklistScreen2({super.key});

  @override
  State<ChecklistScreen2> createState() => _ChecklistScreen2State();
}

class _ChecklistScreen2State extends State<ChecklistScreen2> {
  final checklistController =
      Get.put<ChecklistController>(ChecklistController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: checklistController.formKeyScreen2,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Data',
                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                          fontSize: 16,
                          color: AppPalette.grey.gray380,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      25.height,
                      const AppTextFieldHeader(title: 'Settlement'),
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
                        controller: checklistController.settlement,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'House Number'),
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
                        controller: checklistController.houseNumber,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'House Hold Number'),
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
                        controller: checklistController.houseHoldNumber,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Pregnant Woman\'s Name'),
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
                        controller: checklistController.pregnantWomansName,
                      ),
                      20.height,
                      Text(
                        'Vital Event (1)',
                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                          fontSize: 16,
                          color: AppPalette.grey.gray380,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      20.height,
                      const AppTextFieldHeader(
                          title: 'Expected Date of Delivery'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          final DateTime now = DateTime.now();
                          var picked = await showDatePicker(
                            context: context,
                            initialDate:
                                checklistController.expectedDateOfDelivery ??
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
                                  checklistController.expectedDateOfDelivery) {
                            var formattedDate =
                                DateFormat('yyyy-MM-dd').format(picked);
                            checklistController
                                .setExpectedDateOfDelivery(picked);

                            checklistController
                                .setSelectedExpectedDateOfDelivery(
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
                                                  .selectExpectedDateOfDelivery !=
                                              null
                                          ? checklistController
                                              .selectExpectedDateOfDelivery
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
                      const AppTextFieldHeader(title: 'ANC Facility Visit'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select ANC Facility',
                          value: checklistController.selectedAncFacility.value,
                          items: checklistController.ancFacility,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select ANC Facility';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.selectedAncFacility.value =
                                value;
                            debugPrint(
                                checklistController.selectedAncFacility.value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'Child\'s Name'),
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
                        controller: checklistController.childName,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Child\'s Gender'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select Child\'s Gender',
                          value: checklistController.selectedChildGender.value,
                          items: checklistController.childGender,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Child Gender';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.selectedChildGender.value =
                                value;
                            debugPrint(
                                checklistController.selectedChildGender.value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'Date of Birth (DOB)'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          final DateTime now = DateTime.now();
                          var picked = await showDatePicker(
                            context: context,
                            initialDate: checklistController.dateOfBirth ??
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
                              picked != checklistController.dateOfBirth) {
                            var formattedDate =
                                DateFormat('yyyy-MM-dd').format(picked);
                            checklistController.setDateOfBirth(picked);

                            checklistController
                                .setSelectedDateOfBirth(formattedDate);
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
                                      checklistController.selectDateOfBirth !=
                                              null
                                          ? checklistController
                                              .selectDateOfBirth
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
                      20.height,
                      Text(
                        'Vital Event (2)',
                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                          fontSize: 16,
                          color: AppPalette.grey.gray380,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      20.height,
                      const AppTextFieldHeader(title: 'PNC Facility Visit'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select PNC Facility',
                          value: checklistController.selectedPncFacility.value,
                          items: checklistController.pncFacility,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select PNC Facility';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.selectedPncFacility.value =
                                value;
                            debugPrint(
                                checklistController.selectedPncFacility.value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'Immunization'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select Immunization',
                          value: checklistController.selectedImmunization.value,
                          items: checklistController.immunization,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Immunization';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.selectedImmunization.value =
                                value;
                            debugPrint(
                                checklistController.selectedImmunization.value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(
                          title: 'Growth Monitoring L & W'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select Growth Monitoring L & W',
                          value: checklistController
                              .selectedGrowthMonitoring.value,
                          items: checklistController.growthMonitoring,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Growth Monitoring L & W';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.selectedGrowthMonitoring.value =
                                value;
                            debugPrint(checklistController
                                .selectedGrowthMonitoring.value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'Nutritional Service'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select Nutritional Service',
                          value: checklistController
                              .selectedNutritionalService.value,
                          items: checklistController.nutritionalService,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Nutritional Service';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController
                                .selectedNutritionalService.value = value;
                            debugPrint(checklistController
                                .selectedNutritionalService.value);
                          },
                        );
                      }),
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
