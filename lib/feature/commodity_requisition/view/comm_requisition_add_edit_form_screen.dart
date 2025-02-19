import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/commodity_requisition/modal/completed_requisition_success_modal.dart';
import 'package:demo_app/feature/commodity_requisition/provider/commodity_requisition_controller.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class CommRequisitionAddEditFormScreen extends StatefulWidget {
  const CommRequisitionAddEditFormScreen({super.key});

  @override
  State<CommRequisitionAddEditFormScreen> createState() => _CommRequisitionAddEditFormScreenState();
}

class _CommRequisitionAddEditFormScreenState extends State<CommRequisitionAddEditFormScreen> {
  final controller = Get.put<CommodityRequisitionController>(CommodityRequisitionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Commodity Requisition and Issuance Form',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          //centerTitle: true,
          backgroundColor: AppPalette.white,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () => appRoute.pop(),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/back.svg",
                    colorFilter: const ColorFilter.mode(AppPalette.black, BlendMode.srcIn)),
              ),
            ),
          )),
      body: Form(
        key: controller.formKeyRequisition,
        child: Container(
          color: AppPalette.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.height,
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                      controller.lgaValue.value = 'Select a Local Government Area';
                                      controller.statesLga.value?.clear();
                                      controller.statesLga.value?.add(controller.lgaValue.value);
                                      controller.statesLga.value
                                          ?.addAll(NigerianStatesAndLGA.getStateLGAs(value));

                                      controller.setNgState(value);
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
                                    items: controller.statesLga.value,
                                    validator: (value) {
                                      if (value == 'Select a Local Government Area' ||
                                          value!.isEmpty) {
                                        return 'Please Select Local Government Area';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      controller.setNgLGA(value);
                                    },
                                  ),
                                ],
                              );
                            }),
                          )
                        ],
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Ward'),
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
                        controller: controller.wardRequisition,
                      ),
                      29.height,
                      Obx(() {
                        return Column(
                          children: [
                            const AppTextFieldHeader(title: 'Focal PHC Facility'),
                            5.height,
                            AncDropDownButton(
                              hint: 'Select a Facility',
                              value: controller.selectedFocalPHCFacility.value,
                              items: controller.focalPHCFacility,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select a Facility';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                controller.selectedFocalPHCFacility.value = value;
                                debugPrint(controller.selectedFocalPHCFacility.value);
                              },
                            ),
                          ],
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'Chip Agent Name'),
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
                        controller: controller.chipAgentNameRequisition,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Chip Agent ID No.'),
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
                        controller: controller.chipAgentIdNoRequisition,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Date'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          final DateTime now = DateTime.now();
                          var picked = await showDatePicker(
                            context: context,
                            initialDate: controller.date ?? DateTime.now(),
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
                          if (picked != null && picked != controller.date) {
                            var formattedDate = DateFormat('yyyy-MM-dd').format(picked);
                            controller.setDate(picked);
                            controller.setSelectedDate(formattedDate);
                          }
                        },
                        child: Obx(() {
                          return Container(
                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10, right: 8),
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
                                      controller.selectDate != null
                                          ? controller.selectDate.toString()
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
                      29.height,
                      const AppTextFieldHeader(title: 'Requisition No'),
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
                        controller: controller.requisitionNoRequisition,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Unit Quantity'),
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
                        controller: controller.unitQuantityRequisition,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Quantity Required'),
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
                        controller: controller.quantityRequiredRequisition,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Quantity Issued'),
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
                        controller: controller.quantityIssuedRequisition,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Quantity Received'),
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
                        controller: controller.quantityReceivedRequisition,
                      ),
                      20.height,
                      AppElevatedButton(
                        onPressed: () {
                          final isValid = controller.formKeyRequisition.currentState!.validate();
                          if (!isValid) {
                            return;
                          }
                          if (controller.selectDate == null) {
                            showAlertDialog('Date of schedule cannot be empty');
                            return;
                          }

                          showModalBottomSheet(
                              backgroundColor: const Color(0xffFEFEFE),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                              ),
                              isScrollControlled: true,
                              enableDrag: true,
                              context: context,
                              builder: (builder) {
                                return Container(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                  ),
                                  child: const Wrap(
                                    children: [
                                      CompletedRequisitionSuccessModal(),
                                    ],
                                  ),
                                );
                              });
                        },
                        width: context.width,
                        text: "Submit",
                        height: 50,
                        fontSize: 13,
                      ),
                      20.height,
                      AppOutlinedButton(
                          width: MediaQuery.of(context).size.width,
                          onPressed: () async {},
                          text: 'Delete Form',
                          color: const Color(0xffE80101),
                          textColor: const Color(0xffE80101),
                          height: 50.0,
                          radius: 8,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                      40.height,
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

  showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Action Required"),
              content: Text(message),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
