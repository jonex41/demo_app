import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class IEVDataScreen1 extends StatefulWidget {
  const IEVDataScreen1({super.key});

  @override
  State<IEVDataScreen1> createState() => _IEVDataScreen1State();
}

class _IEVDataScreen1State extends State<IEVDataScreen1> {
  final controller =
      Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  void initState() {
    super.initState();
    if (controller.isEditing.value) {
      controller.isFirstTime.value = true;
      controller.teamCode.text =
          controller.selectedMap["enumerator"]["teamCode"].toString();

      controller.stateValue.value =
          controller.selectedMap["settlement"]["state"].toString();

      //  listLga.insert(0, "Select Lga");
      // controller.lgaValue.value = listLga[0];

      // controller.lgaValue.value = listLga[0];

      Future.delayed(const Duration(seconds: 2), () {
        List<String> listLga = [];
        listLga =
            NigerianStatesAndLGA.getStateLGAs(controller.stateValue.value);
        controller.listLga.assignAll(listLga ?? []);
        controller.lgaValue.value =
            controller.selectedMap["settlement"]["lga"].toString();
      });

      Future.delayed(const Duration(seconds: 3), () {
        controller.getWardLocally(
            controller.stateValue.value, controller.lgaValue.value ?? "");
        controller.wardValue.value =
            controller.selectedMap["settlement"]["ward"].toString();
      });

      Future.delayed(const Duration(seconds: 4), () {
        controller.getSettlementLocally(controller.stateValue.value,
            controller.lgaValue.value!, controller.wardValue.value ?? "");
        controller.selectedSettlement.value =
            controller.selectedMap["settlement"]["settlement"].toString();
      });

      controller.houseNumber.text =
          controller.selectedMap["household"]["houseNumber"].toString();
      controller.isFirstTime.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyScreen1,
        child: Obx(() {
          return Container(
            color: AppPalette.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(context, 'Enumerator Information'),
                        18.height,
                        const AppTextFieldHeader(title: 'Name of Enumerator:'),
                        5.height,
                        AppTextField(
                          textFieldType: TextFieldType.NAME,
                          isValidationRequired: true,
                          readOnly: true,
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
                          controller: controller.nameOfEnumerator,
                        ),
                        18.height,
                        const AppTextFieldHeader(title: 'Phone Number:'),
                        5.height,
                        AppTextField(
                          textFieldType: TextFieldType.PHONE,
                          isValidationRequired: true,
                          readOnly: true,
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
                          controller: controller.phoneNumber,
                        ),
                        18.height,
                        const AppTextFieldHeader(title: 'Team Code:'),
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
                          controller: controller.teamCode,
                        ),
                        18.height,
                        header(context, 'Settlement Demographics'),
                        18.height,
                        Row(
                          children: [
                            Expanded(
                              child: Obx(() {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppTextFieldHeader(title: 'State'),
                                    5.height,
                                    AncDropDownButton(
                                      hint: 'Select a State',
                                      value: controller.stateValue.value,
                                      items: NigerianStatesAndLGA.allStates,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Select State';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.setNgState(value);
                                        /*  controller.setNgState(value);
        
                                              controller
                                                  .getLga(controller.stateValue.value); */
                                        //listOfSettlementValue
                                        print("selected state $value");
                                        List<String> listLga = [];
                                        listLga =
                                            NigerianStatesAndLGA.getStateLGAs(
                                                value);

                                        //  listLga.insert(0, "Select Lga");
                                        controller.lgaValue.value = listLga[0];
                                        controller.listLga
                                            .assignAll(listLga ?? []);
                                        controller.lgaValue.value = listLga[0];
                                      },
                                    ),
                                  ],
                                );
                              }),
                            ),
                            18.width,
                            Expanded(
                              child: Obx(() {
                                return Column(
                                  children: [
                                    const AppTextFieldHeader(title: 'LGA'),
                                    5.height,
                                    AncDropDownButton(
                                      hint: 'Select a Local Government Area',
                                      value: controller.lgaValue.value,
                                      items: controller.listLga,
                                      validator: (value) {
                                        if (value ==
                                                'Select a Local Government Area' ||
                                            value!.isEmpty) {
                                          return 'Please Select Local Government Area';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.setNgLGA(value);
                                        // controller.wardValue.value = "";

                                        controller.getWardLocally(
                                            controller.stateValue.value, value);
                                        //  print("i am here $wards");

                                        /*  controller.getWard(
                                                  controller.stateValue.value, value); */
                                      },
                                    ),
                                  ],
                                );
                              }),
                            )
                          ],
                        ),
                        18.height,
                        const AppTextFieldHeader(title: 'Ward'),
                        5.height,
                        Obx(
                          () => AncDropDownButton(
                            hint: 'Select a Ward',
                            value: controller.wardValue.value,
                            items: controller.listWard.value,
                            validator: (value) {
                              if (value == 'Select a Ward' || value!.isEmpty) {
                                return 'Please Select Ward';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              // controller.listWard.value = value;
                              controller.wardValue.value = value;

                              controller.getSettlementLocally(
                                  controller.stateValue.value,
                                  controller.lgaValue.value!,
                                  value);
                              /*  controller.selectedSettlement.value =
                                                  "Select Settlement";
        
                                              controller.getSettlement(
                                                  controller.stateValue.value,
                                                  controller.lgaValue.value!,
                                                  controller.wardValue.value!,
                                                  ""); */
                            },
                          ),
                        ),
                        18.height,
                        const AppTextFieldHeader(title: 'Settlement'),
                        5.height,
                        Obx(() {
                          return AncDropDownButton(
                            hint: 'Select a Settlement',
                            value: controller.selectedSettlement.value,
                            items: controller.listSettlement.value ?? [],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Select Settlement';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              controller.selectedSettlement.value = value;
                            },
                          );
                        }),
                        18.height,
                        Text(
                          'Consent',
                          style:
                              context.theme.appTextTheme.bodyMedium16.copyWith(
                            fontSize: 15,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        18.height,
                        header(context, 'Consent Enumerator Introduction:'),
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
                          18.height,
                          if (controller.selectedProceedReason.value ==
                              'Others specify') ...[
                            const AppTextFieldHeader(title: 'Others specify'),
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
                              controller: controller.othersProceedSpecify,
                            ),
                          ]
                        ],
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
          fontSize: 15,
          color: AppPalette.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
