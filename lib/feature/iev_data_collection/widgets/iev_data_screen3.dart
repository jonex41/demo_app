import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class IEVDataScreen3 extends StatefulWidget {
  const IEVDataScreen3({super.key});

  @override
  State<IEVDataScreen3> createState() => _IEVDataScreen3State();
}

class _IEVDataScreen3State extends State<IEVDataScreen3> {
  final controller = Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyScreen3,
        child: Obx(() {
          return Container(
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
                        18.height,
                        const AppTextFieldHeader(
                            title: 'How many under 5 children does this mother have?'),
                        5.height,
                        AppTextField(
                          textFieldType: TextFieldType.NUMBER,
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
                          controller: controller.under5ChildrenMotherHave,
                        ),
                        18.height,
                        const AppTextFieldHeader(title: 'Name of Child:'),
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
                          controller: controller.nameofChild,
                        ),
                        18.height,
                        const AppTextFieldHeader(title: 'Do you know the date of birth?'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedKnowDateOfBirth.value,
                            items: controller.knowDateOfBirth,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select an option';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedKnowDateOfBirth.value = value;
                            },
                          );
                        }),
                        18.height,
                        if (controller.selectedKnowDateOfBirth.value == 'Yes') ...[
                          const AppTextFieldHeader(title: 'Date of Birth:'),
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
                                padding:
                                    const EdgeInsets.only(left: 8, top: 10, bottom: 10, right: 8),
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
                                          controller.selectDateOfBirth != null
                                              ? controller.selectDateOfBirth.toString()
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
                        ] else ...[
                          const AppTextFieldHeader(title: 'Age Category:'),
                          5.height,
                          Obx(() {
                            return AncDropDownButton(
                              hint: 'Select an answer',
                              value: controller.selectedAgeCategory.value,
                              items: controller.ageCategory,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select Age Category';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                controller.selectedAgeCategory.value = value;
                              },
                            );
                          })
                        ],
                        18.height,
                        const AppTextFieldHeader(title: 'Gender'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedGender.value,
                            items: controller.gender,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select an answer';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedGender.value = value;
                            },
                          );
                        }),
                        18.height,
                        const AppTextFieldHeader(
                            title: 'Does the child have an RI vaccination card?'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedHaveRiVaccinationCard.value,
                            items: controller.riVaccinationCard,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select an answer';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedHaveRiVaccinationCard.value = value;
                            },
                          );
                        }),
                        18.height,
                        if (controller.selectedHaveRiVaccinationCard.value == 'Yes') ...[
                          const AppTextFieldHeader(title: 'If Yes, select received antigens:'),
                          5.height,
                          Obx(() {
                            return MultiSelectDialogField(
                              title: const Text(
                                "You can select more than one option",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              buttonIcon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: AppPalette.grey.gray350,
                              ),
                              itemsTextStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: BoxDecoration(
                                //  color: AppPalette.grey.gray300,
                                border: Border.all(
                                  color: AppPalette.grey.gray300,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              items: controller.selectReceivedAntigens
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
                                controller.selectedReceivedAntigens.value = values;
                                debugPrint('${controller.selectedReceivedAntigens.value}');
                              },
                            );
                          }),
                          18.height,
                          const AppTextFieldHeader(
                              title: 'How many visits has the child had to the Health facility?'),
                          5.height,
                          AppTextField(
                            textFieldType: TextFieldType.NUMBER,
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
                            controller: controller.howManyVisitChildHadToHealthFacility,
                          ),
                          18.height,
                          const AppTextFieldHeader(
                              title:
                                  'On which part of the body did the child take the last vaccine?:'),
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
                            controller: controller.siteOfLastVaccine,
                          ),
                          18.height,
                        ],
                      ],
                    )),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
