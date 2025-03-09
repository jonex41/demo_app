import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:demo_app/feature/util/LocationHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  Flexible(
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppTextFieldHeader(
                            title:
                                'How many other pregnant women are in the household (pregnant women who are not married to the head of household)?'),
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
                            controller.updateFieldCountOtherPregnantWomenInHouseHold(count);
                          },
                          decoration: inputDecoration().copyWith(
                              hintText: 'Enter your answer',
                              hintStyle: const TextStyle(
                                color: Color(0xFF899197),
                              )),
                          suffixIconColor: AppPalette.white,
                          textStyle: const TextStyle(
                              fontSize: 16, color: AppPalette.black, fontWeight: FontWeight.w400),
                          controller: controller.numberOfPregnantWomen,
                        ),
                        Flexible(child: Obx(() {
                          return ListView.builder(
                              itemCount:
                                  controller.textFieldCountOtherPregnantWomenInHouseHold.value,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      18.height,
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AppTextFieldHeader(
                                                  title:
                                                      'First Name of pregnant woman: ${index + 1}'),
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
                                                controller: controller
                                                    .firstNamePregnantWomanControllerLoop[index],
                                              ),
                                            ],
                                          )),
                                          18.width,
                                          Expanded(
                                              child: Column(
                                            children: [
                                              AppTextFieldHeader(
                                                  title: 'Surname of pregnant woman: ${index + 1}'),
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
                                                controller: controller
                                                    .surNamePregnantWomanControllerLoop[index],
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'How many months pregnant is the woman? ${index + 1}'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an answer',
                                          value: controller
                                              .selectedHowManyMonthsPregnantLoop[index].value,
                                          items: controller.monthsPregnant,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller.selectedHowManyMonthsPregnantLoop[index]
                                                .value = value;
                                          },
                                        );
                                      }),
                                      18.height,
                                      AppTextFieldHeader(
                                          title: 'Has the woman taken TT/Td vaccine? ${index + 1}'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an answer',
                                          value: controller
                                              .selectedHasWomanTakenTTIDVaccineLoop[index].value,
                                          items: controller.isMotherPregnant,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller.selectedHasWomanTakenTTIDVaccineLoop[index]
                                                .value = value;
                                          },
                                        );
                                      }),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'How many doses of TT/Td vaccine has the woman taken? ${index + 1}'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an answer',
                                          value: controller
                                              .selectedDosesTDVaccineTakenPregnantLoop[index].value,
                                          items: controller.dosesTDVaccineTaken,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller
                                                .selectedDosesTDVaccineTakenPregnantLoop[index]
                                                .value = value;
                                          },
                                        );
                                      }),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'What is the name of the healthcare facility where the woman receives antenatal care? ${index + 1}'),
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
                                            fontSize: 16,
                                            color: AppPalette.black,
                                            fontWeight: FontWeight.w400),
                                        controller: controller
                                                .nameHealthCareFacilityWomanReceivesAntenatalCareControllerPregnantLoop[
                                            index],
                                      ),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'How many times has the woman visited the health facility for ANC? ${index + 1}'),
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
                                            fontSize: 16,
                                            color: AppPalette.black,
                                            fontWeight: FontWeight.w400),
                                        controller: controller
                                                .timesTheWomanVisitedHealthFacilityControllerPregnantLoop[
                                            index],
                                      ),
                                      18.height,
                                      const Divider(),
                                    ],
                                  );
                                });
                              });
                        })),
                        18.height,
                        const AppTextFieldHeader(
                            title: 'Are there other women aged 15 to 49 are in the household?'),
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
                          const AppTextFieldHeader(
                              title: 'How many other women aged 15 to 49 are in the household?'),
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
                              controller
                                  .updateFieldCountHowManyOtherWomenAreThereInHouseHold(count);
                            },
                            decoration: inputDecoration().copyWith(
                                hintText: 'Enter your answer',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF899197),
                                )),
                            suffixIconColor: AppPalette.white,
                            textStyle: const TextStyle(
                                fontSize: 16, color: AppPalette.black, fontWeight: FontWeight.w400),
                            controller: controller.womenAreThereInHouseHoldAge15And55,
                          ),
                          18.height,
                          Flexible(child: Obx(() {
                            return ListView.builder(
                                itemCount: controller
                                    .textFieldCountHowManyOtherWomenAreThereInHouseHold.value,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Obx(() {
                                    return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  AppTextFieldHeader(
                                                      title:
                                                          'Firstname of the woman: ${index + 1}'),
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
                                                    controller: controller
                                                        .firstNameOtherWomenControllerLoop[index],
                                                  ),
                                                ],
                                              )),
                                              18.width,
                                              Expanded(
                                                  child: Column(
                                                children: [
                                                  AppTextFieldHeader(
                                                      title: 'Surname of the woman: ${index + 1}'),
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
                                                    controller: controller
                                                        .surNameOtherWomenControllerLoop[index],
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                          18.height,
                                          const Divider(),
                                        ]);
                                  });
                                });
                          })),
                        ],
                        18.height,
                        const AppTextFieldHeader(
                            title: 'How many girls aged 9 are in the household?'),
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
                          controller: controller.howManyGirlsAged9AreInHousehold,
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
                                          fontSize: 16,
                                          color: AppPalette.grey.gray350,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '${controller.currentPosition.value?.longitude ?? '0'}',
                                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 16,
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
                                          fontSize: 16,
                                          color: AppPalette.grey.gray350,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '${controller.currentPosition.value?.latitude ?? '0'}',
                                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 16,
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
                                      onPressed: () async {
                                        controller.loadingCoordinate.value = true;
                                        controller.currentPosition.value =
                                            await LocationHandler.getCurrentPosition();
                                        controller.loadingCoordinate.value = false;
                                      },
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
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            controller.loadingCoordinate.value
                                                ? 'Loading...'
                                                : 'Take Geo-Coordinate',
                                            style: const TextStyle(
                                                color: AppPalette.white, fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
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
