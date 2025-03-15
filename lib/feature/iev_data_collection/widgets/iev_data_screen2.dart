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
  void initState() {
    super.initState();
    if (controller.isEditing.value) {
      controller.isFirstTime.value = true;
      Future.delayed(const Duration(seconds: 1), () {
        controller.selectedProceed.value = "Yes";
      });

      controller.headOfHouseHoldName.text =
          controller.selectedMap["headOfHousehold"]["name"].toString();
      controller.headOfHousePhoneNumber.text =
          controller.selectedMap["headOfHousehold"]["phoneNumber"].toString();
      var listMap = controller
          .getDetails(controller.selectedMap["motherDetails"]["mothers"]);
      controller.numberOfMothersInTheHouse.text =
          listMap.length.toString() ?? "0";
      controller.updateEditFields(listMap.length, listMap);
      controller.isFirstTime.value = false;
    }
  }

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
                Flexible(
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      header(context, 'Household details'),
                      18.height,
                      const AppTextFieldHeader(title: 'Household Number:'),
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
                              fontSize: 16,
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w400),
                        controller: controller.houseHoldNumber,
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title:
                              'First name and surname of the head of the household'),
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
                            fontSize: 16,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w400),
                        controller: controller.headOfHouseHoldName,
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Phone number of the head of the household'),
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
                      const AppTextFieldHeader(
                          title:
                              'Number of Women (aged 15 - 49 years) in the Household'),
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
                        /*  onChanged: (value) {
                              int count = int.tryParse(value) ?? 0;
                              controller
                                  .updateFieldCountHowManyOtherWomenAreThereInHouseHold(
                                      count);
                            }, */
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
                        controller:
                            controller.womenAreThereInHouseHoldAge15And49,
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Number of Pregnant women in the household'),
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
                          if (controller.isFirstTime.value == false) {
                            controller
                                .updateFieldCountOtherPregnantWomenInHouseHold(
                                    count);
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
                        controller: controller.numberOfPregnantWomen,
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title:
                              'Number of girls aged 9-14 years in the household'),
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
                            fontSize: 14,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w400),
                        controller: controller.howManyGirlsAged9AreInHousehold,
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Number of under 5 children in the household'),
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
                          if (controller.isFirstTime.value == false) {
                            controller
                                .updateFieldsCountNumberOfUnder5Children(count);
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
                        controller: controller.under5ChildrenMotherHave,
                      ),
                      18.height,
                      /* Column(
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
                              if (controller.isFirstTime.value == false) {
                                controller.updateFields(count);
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
                            controller: controller.numberOfMothersInTheHouse,
                          ),
                          18.height,
                          Flexible(
                            child: Obx(() {
                              return ListView.builder(
                                itemCount: controller
                                    .textFieldCountMothersInTheHouseHold.value,
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
                                          decoration:
                                              inputDecoration().copyWith(
                                                  hintText: 'Enter your answer',
                                                  hintStyle: const TextStyle(
                                                    color: Color(0xFF899197),
                                                  )),
                                          suffixIconColor: AppPalette.white,
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: AppPalette.black,
                                              fontWeight: FontWeight.w400),
                                          controller: controller
                                              .mothersNameControllerLoop[index],
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
                                          decoration:
                                              inputDecoration().copyWith(
                                                  hintText: 'Enter your answer',
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
                                            textFieldType: TextFieldType.OTHER,
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
                      ) */
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
        color: const Color(0xFFE6E6E6),
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
