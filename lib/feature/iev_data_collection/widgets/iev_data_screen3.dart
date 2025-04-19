import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class IEVDataScreen3 extends StatefulWidget {
  const IEVDataScreen3({super.key});

  @override
  State<IEVDataScreen3> createState() => _IEVDataScreen3State();
}

class _IEVDataScreen3State extends State<IEVDataScreen3> {
  final controller =
      Get.put<IEVDataCollectionController>(IEVDataCollectionController());

  @override
  void initState() {
    super.initState();
    if (controller.isEditing.value) {
      controller.isFirstTime.value = true;
      var listMap1 = controller
          .getDetails(controller.selectedMap["motherDetails"]["mothers"]);

      List<Map<String, dynamic>> listChildren = [];

      for (var model in listMap1) {
        listChildren.addAll(controller.getDetails(model["children"]));
      }

      controller.under5ChildrenMotherHave.text =
          listChildren.length.toString() ?? "0";
      controller.updateEditFieldsCountNumberOfUnder5Children(
          listChildren.length, listChildren);
      controller.isFirstTime.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: controller.formKeyScreen3,
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
                        /*  const AppTextFieldHeader(
                            title:
                                'How many under 5 children does this mother have?'),
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
                                  .updateFieldsCountNumberOfUnder5Children(
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
                          controller: controller.under5ChildrenMotherHave,
                        ),
                        18.height, */
                        header(context,
                            'Number of under 5 children in the household'),
                        Flexible(child: Obx(() {
                          return ListView.builder(
                              itemCount: controller
                                  .textFieldCountNumberOfUnder5Children.value,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'First name and surname of ${controller.cardinals[index]} child'),
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
                                            .nameofChildControllerLoop[index],
                                      ),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'Do you know the date of birth of the ${controller.cardinals[index]} child?'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an Option',
                                          value: controller
                                              .selectedKnowDateOfBirthLoop[
                                                  index]
                                              .value,
                                          items: controller.knowDateOfBirth,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller
                                                .selectedKnowDateOfBirthLoop[
                                                    index]
                                                .value = value;
                                            debugPrint(controller
                                                .selectedKnowDateOfBirthLoop[
                                                    index]
                                                .value);
                                            controller
                                                .selectedAntigensLoop[index]
                                                .value = [];

                                            controller.selectedDatesLoop[index]
                                                .value = null;
                                            controller
                                                .childAgeInWeeksLoop[index]
                                                .value = null;
                                          },
                                        );
                                      }),
                                      18.height,
                                      if (controller
                                              .selectedKnowDateOfBirthLoop[
                                                  index]
                                              .value ==
                                          'Yes') ...[
                                        AppTextFieldHeader(
                                            title:
                                                'Date of birth of the ${controller.cardinals[index]} child?'),
                                        5.height,
                                        Obx(() {
                                          final selectedDate = controller
                                              .selectedDatesLoop[index].value;
                                          return GestureDetector(
                                            onTap: () => controller.pickDate(
                                                context, index),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(12),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                selectedDate == null
                                                    ? "Tap to select date"
                                                    : controller
                                                        .calculateHumanReadableAge(
                                                            selectedDate) /* controller.getFormattedAge(
                                                        controller
                                                            .selectedDatesLoop[
                                                                index]
                                                            .value!) */ /* controller
                                                        .selectedDatesLoop[
                                                            index]
                                                        .value!
                                                        .toLocal()
                                                        .toString()
                                                        .split(' ')[0] */
                                                ,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                          );
                                        }),
                                      ] else if (controller
                                              .selectedKnowDateOfBirthLoop[
                                                  index]
                                              .value ==
                                          'No') ...[
                                        AppTextFieldHeader(
                                          title:
                                              'What is the age of the ${controller.cardinals[index]} child? (if DOB is uncertain in weeks)',
                                          showCompulsory: false,
                                        ),
                                        5.height,
                                        const Text(
                                            "Hint: use the slider to determine the age in months",
                                            style: TextStyle(fontSize: 16)),
                                        5.height,
                                        Obx(() {
                                          final selectedWeeks = controller
                                                  .childAgeInWeeksLoop[index]
                                                  .value ??
                                              0;
                                          final selectedMonths =
                                              (selectedWeeks / 4.345)
                                                  .toStringAsFixed(1);
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Selected Age: $selectedWeeks weeks (~$selectedMonths months)",
                                                  style: const TextStyle(
                                                      fontSize: 16)),
                                              Slider(
                                                value: selectedWeeks.toDouble(),
                                                min: 0,
                                                max: 624,
                                                divisions: 624,
                                                label: "$selectedWeeks weeks",
                                                onChanged: (double value) {
                                                  controller
                                                      .childAgeInWeeksLoop[
                                                          index]
                                                      .value = value.toInt();
                                                },
                                              ),
                                            ],
                                          );
                                        }),
                                        /*  AppTextFieldHeader(
                                          title:
                                              'What is the age of child? (if DOB is uncertain): ${index + 1}',
                                          showCompulsory: false,
                                        ),
                                        5.height,
                                        Row(children: [
                                          Expanded(
                                              child: Column(children: [
                                            const AppTextFieldHeader(
                                                title: 'Days',
                                                showCompulsory: false),
                                            5.height,
                                            Obx(() {
                                              return AncDropDownButton(
                                                hint: 'Select an Option',
                                                value: controller
                                                    .selectedChildAgeDaysLoop[
                                                        index]
                                                    .value,
                                                items: controller.childAgeDays,
                                                /*  validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please Select an answer';
                                                  } else {
                                                    return null;
                                                  }
                                                }, */
                                                onChanged: (value) {
                                                  controller
                                                      .selectedChildAgeDaysLoop[
                                                          index]
                                                      .value = value;
                                                  debugPrint(controller
                                                      .selectedChildAgeDaysLoop[
                                                          index]
                                                      .value);
                                                },
                                              );
                                            }),
                                          ])),
                                          13.width,
                                          Expanded(
                                              child: Column(children: [
                                            const AppTextFieldHeader(
                                                title: 'Months',
                                                showCompulsory: false),
                                            5.height,
                                            Obx(() {
                                              return AncDropDownButton(
                                                hint: 'Select an Option',
                                                value: controller
                                                    .selectedChildAgeMonthsLoop[
                                                        index]
                                                    .value,
                                                items:
                                                    controller.childAgeMonths,
                                                /*  validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please Select an answer';
                                                  } else {
                                                    return null;
                                                  }
                                                }, */
                                                onChanged: (value) {
                                                  controller
                                                      .selectedChildAgeMonthsLoop[
                                                          index]
                                                      .value = value;
                                                  debugPrint(controller
                                                      .selectedChildAgeMonthsLoop[
                                                          index]
                                                      .value);
                                                },
                                              );
                                            }),
                                          ]))
                                        ]),
                                        18.height,
                                        const AppTextFieldHeader(
                                            title: 'Years',
                                            showCompulsory: false),
                                        5.height,
                                        Obx(() {
                                          return AncDropDownButton(
                                            hint: 'Select an Option',
                                            value: controller
                                                .selectedChildAgeYearsLoop[
                                                    index]
                                                .value,
                                            items: controller.childAgeYears,
                                            /*  validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Select an answer';
                                              } else {
                                                return null;
                                              }
                                            }, */
                                            onChanged: (value) {
                                              controller
                                                  .selectedChildAgeYearsLoop[
                                                      index]
                                                  .value = value;
                                              debugPrint(controller
                                                  .selectedChildAgeYearsLoop[
                                                      index]
                                                  .value);
                                            },
                                          );
                                        }), */
                                      ],
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'What is the sex of the ${controller.cardinals[index]} child'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an Option',
                                          value: controller
                                              .selectedGenderLoop[index].value,
                                          items: controller.gender,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller.selectedGenderLoop[index]
                                                .value = value;
                                            debugPrint(controller
                                                .selectedGenderLoop[index]
                                                .value);
                                          },
                                        );
                                      }),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'Has the ${controller.cardinals[index]} child ever received the polio vaccine in the past?'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an Option',
                                          value: controller
                                              .selectedChildEverReceivedPolioVaccineInPastLoop[
                                                  index]
                                              .value,
                                          items: controller.optionYesNo,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller
                                                .selectedChildEverReceivedPolioVaccineInPastLoop[
                                                    index]
                                                .value = value;
                                            debugPrint(controller
                                                .selectedChildEverReceivedPolioVaccineInPastLoop[
                                                    index]
                                                .value);
                                          },
                                        );
                                      }),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'Has the ${controller.cardinals[index]} child ever received any routine vaccines in the past?'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an Option',
                                          value: controller
                                              .selectedChildEverReceivedRoutineVaccinesInPastLoop[
                                                  index]
                                              .value,
                                          items: controller.optionYesNo,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller
                                                .selectedChildEverReceivedRoutineVaccinesInPastLoop[
                                                    index]
                                                .value = value;
                                            debugPrint(controller
                                                .selectedChildEverReceivedRoutineVaccinesInPastLoop[
                                                    index]
                                                .value);
                                          },
                                        );
                                      }),
                                      18.height,
                                      if (controller
                                              .selectedChildEverReceivedRoutineVaccinesInPastLoop[
                                                  index]
                                              .value !=
                                          "No") ...[
                                        AppTextFieldHeader(
                                            title:
                                                'Does the ${controller.cardinals[index]} child have an RI vaccination card?'),
                                        5.height,
                                        Obx(() {
                                          return AncDropDownButton(
                                            hint: 'Select an answer',
                                            value: controller
                                                .selectedHaveRiVaccinationCardLoop[
                                                    index]
                                                .value,
                                            items: controller.riVaccinationCard,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Select an answer';
                                              } else {
                                                return null;
                                              }
                                            },
                                            onChanged: (value) {
                                              controller
                                                  .selectedHaveRiVaccinationCardLoop[
                                                      index]
                                                  .value = value;
                                            },
                                          );
                                        }),
                                        if (controller
                                                .selectedHaveRiVaccinationCardLoop[
                                                    index]
                                                .value ==
                                            'Yes') ...[
                                          /* AppTextFieldHeader(
                                            title:
                                                'If Yes select Age Category then pick an antigens:  ${index + 1}'),
                                        5.height,
                                        Obx(() {
                                          return AncDropDownButton(
                                            hint: 'Select an answer',
                                            value: controller
                                                    .selectedAges[index]!
                                                    .isEmpty
                                                ? null
                                                : controller
                                                    .selectedAges[index],
                                            items: controller.vaccineData.keys
                                                .toList(),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Select an answer';
                                              } else {
                                                return null;
                                              }
                                            },
                                            onChanged: (newValue) {
                                              if (newValue != null) {
                                                controller.updateVaccineList(
                                                    index, newValue);
                                              }
                                            },
                                          );
                                        }),
                                        18.height,
                                        AppTextFieldHeader(
                                            title:
                                                'Select received antigens:  ${index + 1}'),
                                        5.height,
                                        Obx(() => Column(
                                              children: controller
                                                      .vaccineSelections[index]
                                                      ?.keys
                                                      .map((vaccine) {
                                                    return Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: CheckboxListTile(
                                                        title: Text(
                                                          vaccine,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 13),
                                                        ),
                                                        value: controller
                                                                .vaccineSelections[
                                                            index]?[vaccine],
                                                        onChanged:
                                                            (bool? value) {
                                                          controller.vaccineSelections[
                                                                      index]
                                                                  ?[vaccine] =
                                                              value ?? false;
                                                          controller
                                                              .vaccineSelections
                                                              .refresh();
                                                        },
                                                      ),
                                                    );
                                                  }).toList() ??
                                                  [],
                                            )),
                                        18.height, */
                                          if (controller
                                                  .selectedKnowDateOfBirthLoop[
                                                      index]
                                                  .value ==
                                              'Yes') ...[
                                            18.height,
                                            AppTextFieldHeader(
                                                title:
                                                    'Select the antigens the ${controller.cardinals[index]} child has received'),
                                            5.height,
                                            Obx(() {
                                              /*  final date = controller
                                                  .selectedDatesLoop[index]
                                                  .value;
                                              final antigenOptions = date !=
                                                      null
                                                  ? controller
                                                      .getEligibleAntigens(date)
                                                  : []; */
                                              final weeks = controller
                                                  .calculateWeeksFromDOB(
                                                      controller
                                                          .selectedDatesLoop[
                                                              index]
                                                          .value!);
                                              final eligibleAntigens = controller
                                                  .getEligibleAntigensByWeeks(
                                                      weeks);
                                              return MultiSelectDialogField(
                                                dialogHeight: 500,
                                                title: const Text(
                                                  "Scroll to view more options and you can select more than one option",
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                                buttonIcon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color:
                                                      AppPalette.grey.gray350,
                                                ),
                                                itemsTextStyle: const TextStyle(
                                                    fontSize: 13),
                                                selectedItemsTextStyle:
                                                    const TextStyle(
                                                        fontSize: 13),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppPalette
                                                          .grey.gray300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                items: eligibleAntigens
                                                    .map((e) =>
                                                        MultiSelectItem(e, e))
                                                    .toList(),
                                                /*  items: controller.selectAntigens
                                                  .map((e) =>
                                                      MultiSelectItem(e, e))
                                                  .toList(), */
                                                listType:
                                                    MultiSelectListType.LIST,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Select an Option';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onConfirm: (values) {
                                                  controller
                                                          .selectedAntigensLoop[
                                                              index]
                                                          .value =
                                                      List<String>.from(values);
                                                  debugPrint(
                                                      '${controller.selectedAntigensLoop[index]}');
                                                },
                                              );
                                            }),
                                            18.height,
                                          ] else if (controller
                                                  .selectedKnowDateOfBirthLoop[
                                                      index]
                                                  .value ==
                                              'No') ...[
                                            18.height,
                                            AppTextFieldHeader(
                                                title:
                                                    'Select the antigens the ${controller.cardinals[index]} child has received'),
                                            5.height,
                                            Obx(() {
                                              final selectedWeeks = controller
                                                      .childAgeInWeeksLoop[
                                                          index]
                                                      .value ??
                                                  0;
                                              final selectedMonths =
                                                  (selectedWeeks / 4.345)
                                                      .toStringAsFixed(1);
                                              /* final availableAntigens = controller
                                                  .getAvailableAntigensFromAgeInWeeks(
                                                      selectedWeeks); */
                                              final availableAntigens = controller
                                                  .getEligibleAntigensByWeeks(
                                                      selectedWeeks);
                                              return MultiSelectDialogField(
                                                dialogHeight: 500,
                                                title: const Text(
                                                  "Scroll to view more options and you can select more than one option",
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                                buttonIcon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color:
                                                      AppPalette.grey.gray350,
                                                ),
                                                itemsTextStyle: const TextStyle(
                                                    fontSize: 13),
                                                selectedItemsTextStyle:
                                                    const TextStyle(
                                                        fontSize: 13),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppPalette
                                                          .grey.gray300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                items: availableAntigens
                                                    .map((e) =>
                                                        MultiSelectItem(e, e))
                                                    .toList(),
                                                /*  items: controller.selectAntigens
                                                  .map((e) =>
                                                      MultiSelectItem(e, e))
                                                  .toList(), */
                                                listType:
                                                    MultiSelectListType.LIST,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Select an Option';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onConfirm: (values) {
                                                  controller
                                                          .selectedAntigensLoop[
                                                              index]
                                                          .value =
                                                      List<String>.from(values);
                                                  debugPrint(
                                                      '${controller.selectedAntigensLoop[index]}');
                                                },
                                              );
                                            }),
                                            18.height,
                                          ],

                                          /* AppTextFieldHeader(
                                            title:
                                                'What is the name of HF the child goes for vaccination? ${index + 1}'),
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
                                                  .nameOfHFChildGoesForVaccinationLoop[
                                              index],
                                        ), */
                                        ],
                                        18.height,
                                        AppTextFieldHeader(
                                            title:
                                                'How many visits has the ${controller.cardinals[index]} child had to the Health facility for vaccinations?'),
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
                                                  .howManyVisitChildHadToHealthFacilityLoop[
                                              index],
                                        ),
                                        if (controller
                                                .selectedHaveRiVaccinationCardLoop[
                                                    index]
                                                .value !=
                                            'Yes') ...[
                                          18.height,
                                          AppTextFieldHeader(
                                              title:
                                                  'On which part of the body did the ${controller.cardinals[index]} child take the last vaccine?'),
                                          5.height,
                                          Obx(() {
                                            return MultiSelectDialogField(
                                              dialogHeight: 500,
                                              title: const Text(
                                                "You can select more than one option",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              buttonIcon: Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: AppPalette.grey.gray350,
                                              ),
                                              itemsTextStyle:
                                                  const TextStyle(fontSize: 13),
                                              selectedItemsTextStyle:
                                                  const TextStyle(fontSize: 13),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppPalette.grey.gray300,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              items: controller
                                                  .partOfBodyLastVaccine
                                                  .map((e) =>
                                                      MultiSelectItem(e, e))
                                                  .toList(),
                                              /*  items: controller.selectAntigens
                                                  .map((e) =>
                                                      MultiSelectItem(e, e))
                                                  .toList(), */
                                              listType:
                                                  MultiSelectListType.LIST,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Select an Option';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onConfirm: (values) {
                                                controller
                                                        .selectedSiteOfLastVaccineLoop[
                                                            index]
                                                        .value =
                                                    List<String>.from(values);

                                                debugPrint(
                                                    '${controller.selectedSiteOfLastVaccineLoop[index]}');
                                              },
                                            );
                                            /* return AncDropDownButton(
                                              hint: 'Select an answer',
                                              value: controller
                                                  .selectedSiteOfLastVaccineLoop[
                                                      index]
                                                  .value,
                                              items: controller
                                                  .partOfBodyLastVaccine,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please Select an answer';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onChanged: (value) {
                                                controller
                                                    .selectedSiteOfLastVaccineLoop[
                                                        index]
                                                    .value = value;
                                              },
                                            ); */
                                          }),
                                        ],

                                        /* AppTextField(
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
                                              .siteOfLastVaccineLoop[index],
                                        ), */
                                        18.height,
                                      ],
                                      AppTextFieldHeader(
                                          title:
                                              'What is the name of the primary caregiver of this ${controller.cardinals[index]} child?'),
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
                                                .nameOfPrimaryCareGiverOfChildLoop[
                                            index],
                                      ),
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'Relationship of the primary caregiver to the ${controller.cardinals[index]} child'),
                                      5.height,
                                      Obx(() {
                                        return AncDropDownButton(
                                          hint: 'Select an answer',
                                          value: controller
                                              .selectedRelationShipOfPrimaryCareGiverOfChildLoop[
                                                  index]
                                              .value,
                                          items:
                                              controller.careGiverRelationship,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select an answer';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            controller
                                                .selectedRelationShipOfPrimaryCareGiverOfChildLoop[
                                                    index]
                                                .value = value;
                                          },
                                        );
                                      }),
                                      18.height,
                                      AppTextFieldHeader(
                                          showCompulsory: false,
                                          title:
                                              'Phone number of ${controller.cardinals[index]} child primary caregiver?'),
                                      5.height,
                                      AppTextField(
                                        textFieldType: TextFieldType.PHONE,
                                        isValidationRequired: false,
                                        maxLength: 11,
                                        /*  validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Field is required';
                                          } else if (value.length < 11) {
                                            return 'Phone number cannot be less than 11 digits';
                                          } else if (value.length > 11) {
                                            return 'Phone number cannot be more than 11 digits';
                                          } else {
                                            return null;
                                          }
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
                                        controller: controller
                                                .phoneNumberOfPrimaryCareGiverOfChildLoop[
                                            index],
                                      ),
                                      18.height,
                                      const Divider(),
                                      18.height,
                                    ],
                                  );
                                });
                              });
                        })),
                      ],
                    )),
                  )
                ],
              ),
            ),
          )),
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
