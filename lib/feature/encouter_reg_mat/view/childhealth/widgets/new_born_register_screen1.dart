import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class NewBornRegisterScreen1 extends StatefulWidget {
  const NewBornRegisterScreen1({super.key});

  @override
  State<NewBornRegisterScreen1> createState() => _NewBornRegisterScreen1State();
}

class _NewBornRegisterScreen1State extends State<NewBornRegisterScreen1> {
  final controller = Get.put<EncouterRegMatController>(EncouterRegMatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyNewBornScreen1,
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
                      const AppTextFieldHeader(title: 'Caregiver’s Name'),
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
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.careGiversNameController,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Caregiver’s Contact'),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.PHONE,
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
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.careGiversContactController,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Child’s Name'),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.PHONE,
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
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.childsNameController,
                      ),
                      18.height,
                      Row(
                        children: [
                          Expanded(
                            child: Obx(() {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppTextFieldHeader(title: 'Sex'),
                                  5.height,
                                  AncDropDownButton(
                                    hint: 'Select an Option',
                                    value: controller.selectedSex.value,
                                    items: controller.sex,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Select an option';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      controller.selectedSex.value = value;
                                    },
                                  ),
                                ],
                              );
                            }),
                          ),
                          18.width,
                          Expanded(
                              child: Column(
                            children: [
                              const AppTextFieldHeader(title: 'Date of Birth'),
                              5.height,
                              InkWell(
                                onTap: () async {
                                  final DateTime now = DateTime.now();
                                  var picked = await showDatePicker(
                                    context: context,
                                    initialDate: controller.dateOfBirth ?? DateTime.now(),
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
                                  if (picked != null && picked != controller.dateOfBirth) {
                                    var formattedDate = DateFormat('yyyy-MM-dd').format(picked);
                                    controller.setDateOfBirth(picked);
                                    controller.setSelectedDateOfBirth(formattedDate);
                                  }
                                },
                                child: Obx(() {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 10, bottom: 10, right: 8),
                                    decoration: BoxDecoration(
                                      color: AppPalette.transparent,
                                      border:
                                          Border.all(width: 1.5, color: AppPalette.grey.gray300),
                                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                    ),
                                    child: Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.selectDateOfBirth != null
                                                  ? controller.selectDateOfBirth.toString()
                                                  : 'Select Date',
                                              style:
                                                  context.theme.appTextTheme.bodyMedium16.copyWith(
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
                            ],
                          ))
                        ],
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Age (in Months)'),
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
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.ageInMonthsController,
                      ),
                      18.height,
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFEF6FF),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            'Visit Details',
                            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                              fontSize: 14,
                              color: AppPalette.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      18.height,
                      const AppTextFieldHeader(title: 'Date of Visit'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          final DateTime now = DateTime.now();
                          var picked = await showDatePicker(
                            context: context,
                            initialDate: controller.dateOfVisit ?? DateTime.now(),
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
                          if (picked != null && picked != controller.dateOfVisit) {
                            var formattedDate = DateFormat('yyyy-MM-dd').format(picked);
                            controller.setDateOfVisit(picked);
                            controller.setSelectedDateOfVisit(formattedDate);
                          }
                        },
                        child: Obx(() {
                          return Container(
                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10, right: 8),
                            decoration: BoxDecoration(
                              color: AppPalette.transparent,
                              border: Border.all(width: 1.5, color: AppPalette.grey.gray300),
                              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.selectDateOfVisit != null
                                          ? controller.selectDateOfVisit.toString()
                                          : 'Select Date',
                                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
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
                      18.height,
                      const AppTextFieldHeader(title: 'Settlement'),
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
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.settlementController,
                      ),
                      18.height,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppTextFieldHeader(title: 'House No.'),
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
                                  controller: controller.houseNoController,
                                ),
                              ],
                            ),
                          ),
                          18.width,
                          Expanded(
                              child: Column(
                            children: [
                              const AppTextFieldHeader(title: 'Household No.'),
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
                                controller: controller.houseHoldNoController,
                              ),
                            ],
                          ))
                        ],
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Type of Visit'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedTypeOfVisit.value,
                        items: controller.typeOfVisit,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedTypeOfVisit.value = value;
                        },
                      ),
                      18.height,
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
