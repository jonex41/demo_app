import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class IEVDataScreen2 extends StatefulWidget {
  const IEVDataScreen2({super.key});

  @override
  State<IEVDataScreen2> createState() => _IEVDataScreen2State();
}

class _IEVDataScreen2State extends State<IEVDataScreen2> {
  final controller = Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyScreen2,
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
                      header(context, 'Enumerator Introduction:'),
                      18.height,
                      Text(
                        'Good day, my name is ......................... I am here on behalf of the National Primary Health Care Development Agency (NPHCDA) and State Primary Health Care to ask you questions about the immunization status of children and pregnant women in your household. The information gathered will be used to improve the immunization program. All information you provide will remain confidential.',
                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                          fontSize: 13,
                          color: const Color(0xFF7E7E7E),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'At this time, do you want me to proceed?'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select an Option',
                          value: controller.selectedProceed.value,
                          items: controller.proceed,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Option';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            controller.selectedProceed.value = value;
                            debugPrint(controller.selectedProceed.value);
                          },
                        );
                      }),
                      18.height,
                      header(context, 'Caregiver\'s Profile'),
                      18.height,
                      const AppTextFieldHeader(title: 'Head of Household Name:'),
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
                        controller: controller.headOfHouseHoldName,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Head of Household Phone Number:'),
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
                        controller: controller.headOfHousePhoneNumber,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Mothers Name:'),
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
                        controller: controller.mothersName,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Mother’s Phone Number:'),
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
                        controller: controller.mothersPhoneNumber,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'How many mothers are there in the house?'),
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
                        controller: controller.numberOfMothersInTheHouse,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Is the mother pregnant??'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select an Option',
                          value: controller.selectedIsMotherPregnant.value,
                          items: controller.isMotherPregnant,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Option';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            controller.selectedIsMotherPregnant.value = value;
                            debugPrint(controller.selectedIsMotherPregnant.value);
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
      ),
    );
  }

  Widget header(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF9FAFB),
      ),
      child: Text(
        title,
        style: context.theme.appTextTheme.bodyMedium16.copyWith(
          fontSize: 15,
          color: AppPalette.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
