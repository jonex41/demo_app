import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class IEVDataScreen4 extends StatefulWidget {
  const IEVDataScreen4({super.key});

  @override
  State<IEVDataScreen4> createState() => _IEVDataScreen4State();
}

class _IEVDataScreen4State extends State<IEVDataScreen4> {
  final controller = Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyScreen4,
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
                        const AppTextFieldHeader(
                            title: 'Are there pregnant women in the household?'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedAreTherePregnantWomenInHousehold.value,
                            items: controller.areTherePregnantWomenInHousehold,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select an answer';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedAreTherePregnantWomenInHousehold.value = value;
                            },
                          );
                        }),
                        18.height,
                        const AppTextFieldHeader(
                            title: 'Number of pregnant women in the household:'),
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
                          controller: controller.numberOfPregnantWomen,
                        ),
                        18.height,
                        const AppTextFieldHeader(
                            title:
                                'Are there other women in the household aged between 15 and 55?'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedOtherWomenInTheHousehold.value,
                            items: controller.otherWomenInTheHousehold,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select an answer';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedOtherWomenInTheHousehold.value = value;
                            },
                          );
                        }),
                        if (controller.selectedOtherWomenInTheHousehold.value == 'Yes') ...[
                          18.height,
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppTextFieldHeader(title: 'First Name:'),
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
                                    controller: controller.firstname,
                                  ),
                                ],
                              )),
                              18.width,
                              Expanded(
                                  child: Column(
                                children: [
                                  const AppTextFieldHeader(title: 'Surname:'),
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
                                    controller: controller.surname,
                                  ),
                                ],
                              ))
                            ],
                          )
                        ],
                        18.height,
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppTextFieldHeader(title: 'Age: '),
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
                                  controller: controller.age,
                                ),
                              ],
                            )),
                            18.width,
                            Expanded(
                                child: Column(
                              children: [
                                const AppTextFieldHeader(title: 'Months Pregnant:'),
                                5.height,
                                Obx(() {
                                  return AncDropDownButton(
                                    hint: 'Select an answer',
                                    value: controller.selectedMonthsPregnant.value,
                                    items: controller.monthsPregnant,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Select an answer';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      controller.selectedMonthsPregnant.value = value;
                                    },
                                  );
                                }),
                              ],
                            ))
                          ],
                        ),
                        18.height,
                        const AppTextFieldHeader(title: 'Has the woman taken TT/Td vaccine?'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedTakenTDVaccine.value,
                            items: controller.takenTDVaccine,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select an answer';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedTakenTDVaccine.value = value;
                            },
                          );
                        }),
                        18.height,
                        const AppTextFieldHeader(title: 'If Yes, what doses were taken?'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedDosesTDVaccineTaken.value,
                            items: controller.dosesTDVaccineTaken,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select an answer';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedDosesTDVaccineTaken.value = value;
                            },
                          );
                        }),
                        18.height,
                        const AppTextFieldHeader(title: 'Has the woman commenced ANC visits?'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select an answer',
                            value: controller.selectedCommenceANCVisits.value,
                            items: controller.commenceANCVisits,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select an answer';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedCommenceANCVisits.value = value;
                            },
                          );
                        }),
                        18.height,
                        const AppTextFieldHeader(title: 'Expected Date of Delivery (EDD):'),
                        5.height,
                        InkWell(
                          onTap: () async {
                            final DateTime now = DateTime.now();
                            var picked = await showDatePicker(
                              context: context,
                              initialDate: controller.expectedDateOfDelivery ?? DateTime.now(),
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
                              controller.setExpectedDateOfDelivery(picked);
                              controller.setSelectedExpectedDateOfDelivery(formattedDate);
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
                                        controller.selectExpectedDateOfDelivery != null
                                            ? controller.selectExpectedDateOfDelivery.toString()
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xffEEFFF9),
                            border: Border.all(width: 1.5, color: AppPalette.primary.primary80),
                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Geocoordinates',
                                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                  color: AppPalette.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              5.height,
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Longitude:',
                                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 13,
                                          color: AppPalette.grey.gray350,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '0',
                                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 13,
                                          color: AppPalette.grey.gray350,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  5.height,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Latitude:',
                                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 13,
                                          color: AppPalette.grey.gray350,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '0',
                                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 13,
                                          color: AppPalette.grey.gray350,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              10.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor: AppPalette.white,
                                          backgroundColor: AppPalette.primary.primary400,
                                          padding: const EdgeInsets.all(3.0),
                                          fixedSize: const Size(190, 40),
                                          textStyle: context.theme.appTextTheme.bodyMedium16
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: AppPalette.white,
                                                  fontWeight: FontWeight.w700),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4))),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Take Geo-Coordinate',
                                            style: TextStyle(color: AppPalette.white, fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: AppPalette.white,
                                            size: 18,
                                          )
                                        ],
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        18.height,
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
