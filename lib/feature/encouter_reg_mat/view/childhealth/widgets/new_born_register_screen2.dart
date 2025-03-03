import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class NewBornRegisterScreen2 extends StatefulWidget {
  const NewBornRegisterScreen2({super.key});

  @override
  State<NewBornRegisterScreen2> createState() => _NewBornRegisterScreen2State();
}

class _NewBornRegisterScreen2State extends State<NewBornRegisterScreen2> {
  final controller = Get.put<EncouterRegMatController>(EncouterRegMatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyNewBornScreen2,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTextFieldHeader(title: 'Most Recent Immunization Received'),
                      10.height,
                      const Text(
                        '🌱 At Birth:',
                        style: TextStyle(
                          color: Color(0xFF899197),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      8.height,
                      Obx(() => Wrap(
                            spacing: 8.0, // Space between checkboxes
                            runSpacing: 10.0, // Space between rows
                            children: controller.atBirthVaccines.keys.map((vaccine) {
                              return Container(
                                padding: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFF4F4F4)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFFF9FAFB),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: controller.atBirthVaccines[vaccine],
                                      onChanged: (bool? value) {
                                        controller.toggleSelection(vaccine, value);
                                      },
                                    ),
                                    Text(
                                      vaccine,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                      16.height,
                      const Text(
                        '🍼 6 Weeks (1.5 Months):',
                        style: TextStyle(
                          color: Color(0xFF899197),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      8.height,
                      Obx(() => Wrap(
                            spacing: 8.0, // Space between checkboxes
                            runSpacing: 10.0, // Space between rows
                            children: controller.sixWeeksVaccines.keys.map((vaccine) {
                              return Container(
                                padding: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFF4F4F4)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFFF9FAFB),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: controller.sixWeeksVaccines[vaccine],
                                      onChanged: (bool? value) {
                                        controller.toggleSelectionSixWeeks(vaccine, value);
                                      },
                                    ),
                                    Text(
                                      vaccine,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                      16.height,
                      const Text(
                        '👶 10 Weeks (2.5 Months):',
                        style: TextStyle(
                          color: Color(0xFF899197),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      8.height,
                      Obx(() => Wrap(
                            spacing: 8.0, // Space between checkboxes
                            runSpacing: 10.0, // Space between rows
                            children: controller.tenWeeksVaccines.keys.map((vaccine) {
                              return Container(
                                padding: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFF4F4F4)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFFF9FAFB),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: controller.tenWeeksVaccines[vaccine],
                                      onChanged: (bool? value) {
                                        controller.toggleSelectionTenWeeks(vaccine, value);
                                      },
                                    ),
                                    Text(
                                      vaccine,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                      16.height,
                      const Text(
                        '🧒 14 Weeks (3.5 Months):',
                        style: TextStyle(
                          color: Color(0xFF899197),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      8.height,
                      Obx(() => Wrap(
                            spacing: 8.0, // Space between checkboxes
                            runSpacing: 10.0, // Space between rows
                            children: controller.fourteenWeeksVaccines.keys.map((vaccine) {
                              return Container(
                                padding: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFF4F4F4)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFFF9FAFB),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: controller.fourteenWeeksVaccines[vaccine],
                                      onChanged: (bool? value) {
                                        controller.toggleSelection14Weeks(vaccine, value);
                                      },
                                    ),
                                    Text(
                                      vaccine,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                      16.height,
                      const Text(
                        '🎂 9 Months:',
                        style: TextStyle(
                          color: Color(0xFF899197),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      8.height,
                      Obx(() => Wrap(
                            spacing: 8.0, // Space between checkboxes
                            runSpacing: 10.0, // Space between rows
                            children: controller.nineMonthsVaccines.keys.map((vaccine) {
                              return Container(
                                padding: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFF4F4F4)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFFF9FAFB),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: controller.nineMonthsVaccines[vaccine],
                                      onChanged: (bool? value) {
                                        controller.toggleSelection9Months(vaccine, value);
                                      },
                                    ),
                                    Text(
                                      vaccine,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                      16.height,
                      const Text(
                        '👦 15 Months (1 Year + 3 Months):',
                        style: TextStyle(
                          color: Color(0xFF899197),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      8.height,
                      Obx(() => Wrap(
                            spacing: 8.0, // Space between checkboxes
                            runSpacing: 10.0, // Space between rows
                            children: controller.fifteenMonthsVaccines.keys.map((vaccine) {
                              return Container(
                                padding: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFF4F4F4)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFFF9FAFB),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: controller.fifteenMonthsVaccines[vaccine],
                                      onChanged: (bool? value) {
                                        controller.toggleSelection15Months(vaccine, value);
                                      },
                                    ),
                                    Text(
                                      vaccine,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                      18.height,
                      const AppTextFieldHeader(title: 'Is the child fully immunized?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller.selectedChildFullyImmunized.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedChildFullyImmunized.value = value;
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
