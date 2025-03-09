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
  final controller =
      Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyScreen2,
        child: Obx(() {
          return Container(
            color: AppPalette.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        header(context, 'Enumerator Introduction:'),
                        18.height,
                        Text(
                          'Good day, my name is ......................... I am here on behalf of the National Primary Health Care Development Agency (NPHCDA) and State Primary Health Care to ask you questions about the immunization status of children and pregnant women in your household. The information gathered will be used to improve the immunization program. All information you provide will remain confidential.',
                          style:
                              context.theme.appTextTheme.bodyMedium16.copyWith(
                            fontSize: 14,
                            color: const Color(0xFF7E7E7E),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        18.height,
                        const AppTextFieldHeader(
                            title: 'At this time, do you want me to proceed?'),
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
                        if (controller.selectedProceed.value == 'No') ...[
                          18.height,
                          const AppTextFieldHeader(
                              title:
                                  'If “No"  Select the reason for non-consent'),
                          5.height,
                          Obx(() {
                            return AncDropDownButton(
                              hint: 'Select an Option',
                              value: controller.selectedProceedReason.value,
                              items: controller.proceedReason,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select Option';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                controller.selectedProceedReason.value = value;
                                debugPrint(
                                    controller.selectedProceedReason.value);
                              },
                            );
                          }),
                        ],
                        18.height,
                        header(context, 'Caregiver\'s Profile'),
                        18.height,
                        const AppTextFieldHeader(
                            title: 'Head of Household Name:'),
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
                              fontSize: 16,
                              color: AppPalette.black,
                              fontWeight: FontWeight.w400),
                          controller: controller.headOfHouseHoldName,
                        ),
                        18.height,
                        const AppTextFieldHeader(
                            title: 'Head of Household Phone Number:'),
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
                              fontSize: 16,
                              color: AppPalette.black,
                              fontWeight: FontWeight.w400),
                          controller: controller.headOfHousePhoneNumber,
                        ),
                        18.height,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AppTextFieldHeader(
                                title:
                                    'How many mother/wives are there in the house?'),
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
                              onChanged: (value) {
                                int count = int.tryParse(value) ?? 0;
                                controller.updateFields(count);
                              },
                              decoration: inputDecoration().copyWith(
                                  hintText: 'Enter your answer',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF899197),
                                  )),
                              suffixIconColor: AppPalette.white,
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: AppPalette.black,
                                  fontWeight: FontWeight.w400),
                              controller: controller.numberOfMothersInTheHouse,
                            ),
                            18.height,
                            Flexible(
                              child: Obx(() {
                                return ListView.builder(
                                  itemCount: controller
                                      .textFieldCountMothersInTheHouseHold
                                      .value,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Obx(() {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppTextFieldHeader(
                                              title:
                                                  'Mother/wives Name: ${index + 1}'),
                                          5.height,
                                          AppTextField(
                                            textFieldType: TextFieldType.NAME,
                                            isValidationRequired: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Field is required';
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: inputDecoration()
                                                .copyWith(
                                                    hintText:
                                                        'Enter your answer',
                                                    hintStyle: const TextStyle(
                                                      color: Color(0xFF899197),
                                                    )),
                                            suffixIconColor: AppPalette.white,
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: AppPalette.black,
                                                fontWeight: FontWeight.w400),
                                            controller: controller
                                                    .mothersNameControllerLoop[
                                                index],
                                          ),
                                          18.height,
                                          AppTextFieldHeader(
                                              title:
                                                  'Mother/wives Phone Number: ${index + 1}'),
                                          5.height,
                                          AppTextField(
                                            textFieldType: TextFieldType.NUMBER,
                                            isValidationRequired: true,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Field is required';
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: inputDecoration()
                                                .copyWith(
                                                    hintText:
                                                        'Enter your answer',
                                                    hintStyle: const TextStyle(
                                                      color: Color(0xFF899197),
                                                    )),
                                            suffixIconColor: AppPalette.white,
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: AppPalette.black,
                                                fontWeight: FontWeight.w400),
                                            controller: controller
                                                    .mothersPhoneNumberControllerLoop[
                                                index],
                                          ),
                                          18.height,
                                          AppTextFieldHeader(
                                              title:
                                                  'Is the mother/wife pregnant?: ${index + 1}'),
                                          const SizedBox(height: 5),
                                          Obx(() {
                                            return AncDropDownButton(
                                              hint: 'Select an Option',
                                              value: controller
                                                  .selectedIsMotherPregnantLoop[
                                                      index]
                                                  .value,
                                              items: controller.proceed,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please Select Option';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onChanged: (value) {
                                                controller
                                                    .selectedIsMotherPregnantLoop[
                                                        index]
                                                    .value = value;
                                                debugPrint(controller
                                                    .selectedIsMotherPregnantLoop[
                                                        index]
                                                    .value);
                                              },
                                            );
                                          }),
                                          if (controller
                                                  .selectedIsMotherPregnantLoop[
                                                      index]
                                                  .value ==
                                              'Yes') ...[
                                            18.height,
                                            AppTextFieldHeader(
                                                title:
                                                    'How many months pregnant is the woman? ${index + 1}'),
                                            5.height,
                                            Obx(() {
                                              return AncDropDownButton(
                                                hint: 'Select an Option',
                                                value: controller
                                                    .selectedMonthsPregnantMotherLoop[
                                                        index]
                                                    .value,
                                                items: controller
                                                    .monthsPregnantMother,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please Select Option';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (value) {
                                                  controller
                                                      .selectedMonthsPregnantMotherLoop[
                                                          index]
                                                      .value = value;
                                                  debugPrint(controller
                                                      .selectedMonthsPregnantMotherLoop[
                                                          index]
                                                      .value);
                                                },
                                              );
                                            }),
                                            18.height,
                                            AppTextFieldHeader(
                                                title:
                                                    'Has the pregnant woman started ANC? ${index + 1}'),
                                            5.height,
                                            Obx(() {
                                              return AncDropDownButton(
                                                hint: 'Select an Option',
                                                value: controller
                                                    .selectedHasPregnantWomanStartedAncLoop[
                                                        index]
                                                    .value,
                                                items: controller.proceed,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please Select Option';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (value) {
                                                  controller
                                                      .selectedHasPregnantWomanStartedAncLoop[
                                                          index]
                                                      .value = value;
                                                  debugPrint(controller
                                                      .selectedHasPregnantWomanStartedAncLoop[
                                                          index]
                                                      .value);
                                                },
                                              );
                                            }),
                                            18.height,
                                            AppTextFieldHeader(
                                                title:
                                                    'What is the name of the healthcare facility where the woman receives antenatal care? ${index + 1}'),
                                            5.height,
                                            AppTextField(
                                              textFieldType:
                                                  TextFieldType.OTHER,
                                              isValidationRequired: true,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Field is required';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              decoration: inputDecoration()
                                                  .copyWith(
                                                      hintText:
                                                          'Enter your answer',
                                                      hintStyle:
                                                          const TextStyle(
                                                        color:
                                                            Color(0xFF899197),
                                                      )),
                                              suffixIconColor: AppPalette.white,
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: AppPalette.black,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller
                                                      .nameHealthCareFacilityWomanReceivesAntenatalCareControllerMotherLoop[
                                                  index],
                                            ),
                                            18.height,
                                            AppTextFieldHeader(
                                                title:
                                                    'How many doses of TT/Td vaccine has the woman taken? ${index + 1}'),
                                            5.height,
                                            Obx(() {
                                              return AncDropDownButton(
                                                hint: 'Select an Option',
                                                value: controller
                                                    .selectedDosesTDVaccineTakenMotherLoop[
                                                        index]
                                                    .value,
                                                items: controller
                                                    .dosesTDVaccineTakenMother,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please Select Option';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onChanged: (value) {
                                                  controller
                                                      .selectedDosesTDVaccineTakenMotherLoop[
                                                          index]
                                                      .value = value;
                                                  debugPrint(controller
                                                      .selectedDosesTDVaccineTakenMotherLoop[
                                                          index]
                                                      .value);
                                                },
                                              );
                                            }),
                                            18.height,
                                            AppTextFieldHeader(
                                                title:
                                                    'How many times has the woman visited the health facility for ANC? ${index + 1}'),
                                            5.height,
                                            AppTextField(
                                              textFieldType:
                                                  TextFieldType.NUMBER,
                                              isValidationRequired: true,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Field is required';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              decoration: inputDecoration()
                                                  .copyWith(
                                                      hintText:
                                                          'Enter your answer',
                                                      hintStyle:
                                                          const TextStyle(
                                                        color:
                                                            Color(0xFF899197),
                                                      )),
                                              suffixIconColor: AppPalette.white,
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: AppPalette.black,
                                                  fontWeight: FontWeight.w400),
                                              controller: controller
                                                      .timesTheWomanVisitedHealthFacilityControllerLoop[
                                                  index],
                                            ),
                                          ],
                                          18.height,
                                          const Divider(),
                                          18.height,
                                        ],
                                      );
                                    });
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                        /*18.height,
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
                                onChanged: (value) {
                                  int count = int.tryParse(value) ?? 0;
                                  controller.updateFields(count);
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
                              const AppTextFieldHeader(title: 'End of Loop'),
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
                              const AppTextFieldHeader(title: 'Is the mother pregnant?'),
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
                              const AppTextFieldHeader(title: 'How many months pregnant is the woman?'),
                              5.height,
                              Obx(() {
                                return AncDropDownButton(
                                  hint: 'Select an Option',
                                  value: controller.selectedMonthsPregnantMother.value,
                                  items: controller.monthsPregnantMother,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Select Option';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.selectedMonthsPregnantMother.value = value;
                                    debugPrint(controller.selectedMonthsPregnantMother.value);
                                  },
                                );
                              }),
                              18.height,
                              const AppTextFieldHeader(
                                  title: 'How many doses of TT/Td vaccine has the woman taken?'),
                              5.height,
                              Obx(() {
                                return AncDropDownButton(
                                  hint: 'Select an Option',
                                  value: controller.selectedDosesTDVaccineTakenMother.value,
                                  items: controller.dosesTDVaccineTakenMother,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Select Option';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.selectedDosesTDVaccineTakenMother.value = value;
                                    debugPrint(controller.selectedDosesTDVaccineTakenMother.value);
                                  },
                                );
                              }),
                              18.height,
                              const AppTextFieldHeader(
                                  title:
                                      'How many times has the woman visited the health facility for ANC?'),
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
                                controller: controller.numberOfAncVisitsToHealthFacilityMother,
                              ),
                              18.height,*/
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
          fontSize: 18,
          color: AppPalette.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
