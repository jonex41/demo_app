import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class AddNewScheduleScreen extends StatefulWidget {
  const AddNewScheduleScreen({super.key});

  @override
  State<AddNewScheduleScreen> createState() => _AddNewScheduleScreenState();
}

class _AddNewScheduleScreenState extends State<AddNewScheduleScreen> {
  final checklistController = Get.put<ChecklistController>(ChecklistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'New Schedule',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
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
        key: checklistController.formKeyNewSchedule,
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
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppPalette.white,
                          border: Border.all(width: 1.5, color: AppPalette.grayLight3),
                          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 54,
                              height: 54,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 54,
                                      height: 54,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF2ECE96),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'H',
                                      style: TextStyle(
                                        color: Color(0xFFFEFEFE),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            10.height,
                            Text(
                              'Hauwa Abdullahi Sani',
                              style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                color: AppPalette.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            5.height,
                            Text(
                              'Tell: +234 706 580 8595 | Age: 45years',
                              style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                fontSize: 13,
                                color: AppPalette.grey.gray350,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            10.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                singleItem(
                                  context,
                                  "04/04/2025",
                                  Assets.icons.calendar.svg(),
                                ),
                                20.width,
                                singleItem(
                                  context,
                                  "05:38PM",
                                  Assets.icons.clock.svg(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      25.height,
                      const AppTextFieldHeader(title: 'Chip Agent Unique ID'),
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
                        controller: checklistController.chipAgentUniqueId,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Date of Schedule'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          //final DateTime now = DateTime.now();
                          var picked = await showDatePicker(
                            context: context,
                            initialDate: checklistController.dateOfSchedule ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2300),
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
                          if (picked != null && picked != checklistController.dateOfSchedule) {
                            var formattedDate = DateFormat('yyyy-MM-dd').format(picked);
                            checklistController.setDateOfSchedule(picked);

                            checklistController.setSelectedDateOfSchedule(formattedDate);
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
                                      checklistController.selectDateOfSchedule != null
                                          ? checklistController.selectDateOfSchedule.toString()
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
                      const AppTextFieldHeader(title: 'Time for Schedule'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          checklistController.pickTime(context);
                        },
                        child: Obx(() {
                          final time = checklistController.selectedTime.value;
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
                                      time != null ? time.format(context) : "No time selected",
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
                      const AppTextFieldHeader(title: 'State'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Select a State',
                          value: checklistController.selectedState.value,
                          items: checklistController.allStates,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select State';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            checklistController.selectedState.value = value;
                            debugPrint(checklistController.selectedState.value);
                          },
                        );
                      }),
                      29.height,
                      const AppTextFieldHeader(title: 'Ward'),
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
                        controller: checklistController.ward,
                      ),
                      29.height,
                      const AppTextFieldHeader(title: 'Community'),
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
                        controller: checklistController.community,
                      ),
                      30.height,
                      AppElevatedButton(
                        onPressed: () {
                          final isValid =
                              checklistController.formKeyNewSchedule.currentState!.validate();
                          if (!isValid) {
                            return;
                          }
                          if (checklistController.selectDateOfSchedule == null) {
                            showAlertDialog('Date of schedule cannot be empty');
                            return;
                          }

                          if (checklistController.selectedTime.value == null) {
                            showAlertDialog('Time of schedule cannot be empty');
                            return;
                          }
                        },
                        width: context.width,
                        text: "Schedule",
                        height: 50,
                        fontSize: 13,
                      ),
                      30.height,
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

  Widget circleName(BuildContext context, String name) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppPalette.primary.primary400,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.substring(0, 1),
          style: context.theme.appTextTheme.bodyLarge18
              .copyWith(fontWeight: FontWeight.w500, color: AppPalette.grey.gray50),
        ),
      ),
    );
  }

  Widget singleItem(BuildContext context, String name, SvgPicture svg) {
    return Row(
      children: [
        svg,
        5.width,
        Text(
          name,
          textAlign: TextAlign.center,
          style: context.theme.appTextTheme.labelLarge12.copyWith(
            fontWeight: FontWeight.w500,
            //color: AppPalette.grey.gray360,
          ),
        ),
      ],
    );
  }
}
