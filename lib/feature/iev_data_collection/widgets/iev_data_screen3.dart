import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                        const AppTextFieldHeader(
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
                        18.height,
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
                                          title: 'Name of Child: ${index + 1}'),
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
                                          title: 'Gender: ${index + 1}'),
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
                                              'Does the child have an RI vaccination card?  ${index + 1}'),
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
                                        18.height,
                                        AppTextFieldHeader(
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
                                        18.height,
                                        AppTextFieldHeader(
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
                                        ),
                                        18.height,
                                        AppTextFieldHeader(
                                            title:
                                                'How many visits has the child had to the Health facility? ${index + 1}'),
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
                                      ],
                                      18.height,
                                      AppTextFieldHeader(
                                          title:
                                              'On which part of the body did the child take the last vaccine? ${index + 1}:'),
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
                                        controller: controller
                                            .siteOfLastVaccineLoop[index],
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
}
