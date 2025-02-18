import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/profile/provider/profile_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() {
    return _EditProfileScreenState();
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Profile',
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
        key: controller.formKeyEditProfile,
        child: Container(
          color: AppPalette.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                33.height,
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(alignment: Alignment.center, child: Assets.icons.profileGuy.image()),
                      33.height,
                      const AppTextFieldHeader(title: 'Name'),
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
                            hintText: 'Enter your full name',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.nameEdit,
                      ),
                      20.height,
                      const AppTextFieldHeader(title: 'Email'),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.EMAIL,
                        isValidationRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          } else {
                            return null;
                          }
                        },
                        decoration: inputDecoration().copyWith(
                            hintText: 'Enter your email',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.emailEdit,
                      ),
                      20.height,
                      const AppTextFieldHeader(title: 'Phone NO (+234)'),
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
                            hintText: 'Enter your phone number',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.phoneNumberEdit,
                      ),
                      20.height,
                      const AppTextFieldHeader(title: 'Gender'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'Gender',
                          value: controller.selectedGender.value,
                          items: controller.gender,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select Gender';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            controller.selectedGender.value = value;
                            debugPrint(controller.selectedGender.value);
                          },
                        );
                      }),
                      20.height,
                      const AppTextFieldHeader(title: 'Date of Birth (DOB)'),
                      5.height,
                      InkWell(
                        onTap: () async {
                          final DateTime now = DateTime.now();
                          var picked = await showDatePicker(
                            context: context,
                            initialDate: controller.dateOfBirth ?? DateTime.now(),
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
                            controller.setDateOfBirth(picked);

                            controller.setSelectedDateOfBirth(formattedDate);
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
                                      controller.selectDateOfBirth != null
                                          ? controller.selectDateOfBirth.toString()
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
                      20.height,
                      const AppTextFieldHeader(title: 'State'),
                      5.height,
                      Obx(() {
                        return AncDropDownButton(
                          hint: 'State',
                          value: controller.selectedState.value,
                          items: controller.allStates,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select State';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            controller.selectedState.value = value;
                          },
                        );
                      }),
                      20.height,
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
                            hintText: 'Enter your ward',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.wardEdit,
                      ),
                      20.height,
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
                            hintText: 'Enter your community',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.communityEdit,
                      ),
                      20.height,
                      const AppTextFieldHeader(title: 'Settlement'),
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
                            hintText: 'Enter your your settlement',
                            hintStyle: const TextStyle(
                              color: Color(0xFF899197),
                            )),
                        suffixIconColor: AppPalette.white,
                        textStyle: const TextStyle(
                            fontSize: 14, color: AppPalette.black, fontWeight: FontWeight.w400),
                        controller: controller.communityEdit,
                      ),
                      30.height,
                      AppElevatedButton(
                        onPressed: () {
                          final isValid = controller.formKeyEditProfile.currentState!.validate();
                          if (!isValid) {
                            return;
                          }
                          if (controller.selectDateOfBirth == null) {
                            showAlertDialog('Date of birth cannot be empty');
                            return;
                          }
                        },
                        width: context.width,
                        text: "Save Changes",
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
}
