import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class NewBornRegisterScreen4 extends StatefulWidget {
  const NewBornRegisterScreen4({super.key});

  @override
  State<NewBornRegisterScreen4> createState() => _NewBornRegisterScreen4State();
}

class _NewBornRegisterScreen4State extends State<NewBornRegisterScreen4> {
  final controller =
      Get.put<EncouterRegMatController>(EncouterRegMatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyNewBornScreen4,
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
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF4FFFB),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_box_outlined,
                                  size: 14, color: Color(0xFF027D52)),
                              Text(
                                'Nutrition',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFF027D52),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.32,
                                ),
                              ),
                            ],
                          )),
                      30.height,
                      header('Nutritional assessment'),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'MUAC Measurement (R/Y/G)'),
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
                        controller: controller.muacMeasurmentController,
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Pedal Oedema present?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedPedalOedemaPresent.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedPedalOedemaPresent.value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Does  the child have severe malnutrition?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller
                            .selectedDoesChildHaveSevereMalnutrition.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedDoesChildHaveSevereMalnutrition
                              .value = value;
                        },
                      ),
                      30.height,
                      header('Deworminng'),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Is the child due for deworming?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedIsChildDueDeworming.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedIsChildDueDeworming.value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Albendazole given to the child'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedAlbendazoleGivenToChild.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedAlbendazoleGivenToChild.value =
                              value;
                        },
                      ),
                      18.height,
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFEF6FF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_box_outlined,
                                  size: 14, color: Color(0xFFD72FEB)),
                              Text(
                                'Management of childhood illness',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFFD72FEB),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.32,
                                ),
                              ),
                            ],
                          )),
                      30.height,
                      header('Fever'),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Does the child have fever?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedDoesChildHaveFever.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedDoesChildHaveFever.value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Conduct RDT to test for Malaria?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedConductRDTMalaria.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedConductRDTMalaria.value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Treat confirmed malaria with ACT?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedConfirmMalariaACT.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedConfirmMalariaACT.value = value;
                        },
                      ),
                      30.height,
                      header('Diarrhea'),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Does the child have diarrhea?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedDoesChildHaveDiarrhea.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedDoesChildHaveDiarrhea.value =
                              value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Treat diarrhea with ORS?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedTreatDiarrheaORS.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedTreatDiarrheaORS.value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Treat diarrhea with  Zinc?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedTreatDiarrheaZinc.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedTreatDiarrheaZinc.value = value;
                        },
                      ),
                      30.height,
                      header('Cough'),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Does the child have cough?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedDoesChildHaveCough.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedDoesChildHaveCough.value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Breadths Per Minute?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedBreathsPerMinute.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedBreathsPerMinute.value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Does the child have fast breathing?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedChildHaveFastBreathing.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedChildHaveFastBreathing.value =
                              value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Treat fast breathing with amoxicillin?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller
                            .selectedTreatFastBreathingAmoxicillin.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedTreatFastBreathingAmoxicillin
                              .value = value;
                        },
                      ),
                      18.height,
                      const AppTextFieldHeader(title: 'Follow-up?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedFollowUp.value,
                        items: controller.followUp,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedFollowUp.value = value;
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

  Widget header(String name) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: const BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Text(
          name,
          style: context.theme.appTextTheme.bodyMedium16.copyWith(
            fontSize: 14,
            color: AppPalette.black,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
