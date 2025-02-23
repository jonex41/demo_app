import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/input_text.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/components/my_button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

/* import 'package:opticcs_app/src/component/my_appbar.dart';
import 'package:opticcs_app/src/component/my_button.dart';
import 'package:opticcs_app/src/core/router/locator.dart';
import 'package:opticcs_app/src/core/theme/new_theme/app_color.dart';
import 'package:opticcs_app/src/features/login/provider/login_controller.dart';
import 'package:opticcs_app/src/features/login/widgets/input_text.dart';
 */
@RoutePage()
class ForgotPasswordScreen extends GetView<LoginController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.currrentIndex.value = 0;
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(50, 200),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25),
            child: AppAppBar(
              title: "",
              onPress: () {
                print('qwert   ${controller.currrentIndex.value}');
                if (controller.currrentIndex.value == 0) {
                  appRoute.pop();
                } else if (controller.currrentIndex.value == 1) {
                  controller.currrentIndex.value = 0;
                } else if (controller.currrentIndex.value == 2) {
                  print('qwqqqqqert   ${controller.currrentIndex.value}');
                  controller.currrentIndex.value = 1;
                }
              },
            ),
          ),
        ),
        //resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Reset Password",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 36,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                5.height,
                Obx(
                  () => Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      getRightString1(),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 16,
                          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                          fontWeight: FontWeight.bold,
                          color: AppPalette.primary.primary400),
                    ),
                  ),
                ),
                70.height,
                Obx(() {
                  if (controller.currrentIndex.value == 0) {
                    return _enterNumberWidget(context);
                  } else if (controller.currrentIndex.value == 1) {
                    return _otpWidget();
                  } else {
                    return _confirmPassword(context);
                  }
                }),
                Align(
                  alignment: Alignment.center,
                  child: AppElevatedButton(
                    textColor: Colors.white,
                    color: AppPalette.primary.primary400,
                    height: 56,
                    radius: 30,
                    text: getRightString(),
                    onPressed: () {
                      if (controller.currrentIndex.value == 0) {
                        controller.forgotPasswordSendOtp(context);
                      } else if (controller.currrentIndex.value == 1) {
                        controller.forgotPasswordConfirmOtp(context);
                      } else {
                        controller.forgotPasswordReset(context);
                      }
                    },
                  ),
                ),
                30.height,
                20.height,
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _otpWidget() {
    final otpController = TextEditingController();
    controller.otpString.value = '';
    return Column(
      children: [
        PinCodeFields(
          length: 4,
          fieldBorderStyle: FieldBorderStyle.square,
          obscureText: true,
          obscureCharacter: '●',
          responsive: false,
          fieldHeight: 60.0,
          fieldWidth: 60.0,
          borderWidth: 1.0,
          controller: otpController,
          activeBorderColor: const Color(0xFF027D52),
          activeBackgroundColor: const Color(0xFFE9ECF1),
          borderRadius: BorderRadius.circular(10.0),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          autoHideKeyboard: false,
          fieldBackgroundColor: AppPalette.white,
          borderColor: const Color(0xFFE9ECF1),
          textStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          onComplete: (output) {
            // Your logic with pin code

            controller.otpString.value = output;
            print(output);
            //  controller.setOtpCode(output);
          },
        ),
        20.height,
      ],
    );
  }

  Widget _enterNumberWidget(BuildContext context) {
    return Column(
      children: [
        Form(
          key: controller.forgotPhoneKey,
          child: InputWithTextHead(
            title: "Phone number",
            hintText: "07010261589",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone Number cannot be empty";
              }
              if (value.length != 11) {
                return "Phone Number must be 11 digits";
              }
              return null;
            },
            textColor: AppPalette.primary.primary400,
            anotherColor: Colors.black,
            controller: controller.phoneController,
            textFieldType: TextFieldType.NUMBER,
          ),
        ),
        20.height,
      ],
    );
  }

  Widget _confirmPassword(BuildContext context) {
    return Form(
      key: controller.passwordKey,
      child: Column(
        children: [
          InputWithTextHead(
            title: "Password",
            textColor: AppPalette.primary.primary400,
            suffixColor: Colors.black,
            anotherColor: Colors.black,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              }
              if (!RegExp(
                      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                  .hasMatch(value)) {
                return "Password must be at least 8 characters\n"
                    "Include 1 capital letter, 1 number, and 1 symbol";
              }
              return null;
            },
            hintText: "Enter your Password",
            controller: controller.resetPasswordController,
            textFieldType: TextFieldType.PASSWORD,
          ),
          20.height,
          InputWithTextHead(
            title: "Confirm Password",
            textColor: AppPalette.primary.primary400,
            hintText: "Confirm your Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              }
              if (!RegExp(
                      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                  .hasMatch(value)) {
                return "Password must be at least 8 characters\n"
                    "Include 1 capital letter, 1 number, and 1 symbol";
              }
              return null;
            },
            suffixColor: Colors.black,
            anotherColor: Colors.black,
            controller: controller.resetConfirmPasswordController,
            textFieldType: TextFieldType.PASSWORD,
          ),
          30.height,
        ],
      ),
    );
  }

  String getRightString() {
    if (controller.currrentIndex.value == 0) {
      return 'Send new password';
    } else if (controller.currrentIndex.value == 1) {
      return 'Confirm Otp';
    }
    return 'Reset password';
  }

  String getRightString1() {
    if (controller.currrentIndex.value == 0) {
      return 'Please enter your phone number';
    } else if (controller.currrentIndex.value == 1) {
      return 'Please enter the Otp sent to your\n phone number';
    }
    return 'Please enter your new password';
  }
}
