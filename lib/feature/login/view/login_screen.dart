import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/input_text.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';
import '../provider/login_controller.dart';

@RoutePage()
class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.login.path),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
          children: [
            /* const Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.close,
                color: AppPalette.white,
                size: 27,
              ),
            ), */
            15.height,
            Row(
              children: [
                Text(
                  'Welcome back ',
                  style: context.theme.appTextTheme.headlineMedium32.copyWith(
                      color: AppPalette.white, fontWeight: FontWeight.w500),
                ),
                Assets.icons.wave.image(),
              ],
            ),
            6.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Please enter your login details',
                style: context.theme.appTextTheme.labelLarge12.copyWith(
                    color: AppPalette.white, fontWeight: FontWeight.w600),
              ),
            ),
            40.height,
            Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  InputWithTextHead(
                    title: "User Id",
                    textFieldType: TextFieldType.NAME,
                    hintText: "Enter your user Id",
//callBack: (value) {},

                    controller: controller.emailController,
                  ),
                  20.height,
                  InputWithTextHead(
                    title: "Password",
                    textFieldType: TextFieldType.PASSWORD,
                    hintText: "Enter your password",

                    // callBack: (value) {},
                    /*  validator: (value) {
                      if (value.isEmptyOrNull) {
                        return "Password cannot be empty";
                      }
                      return null;
                    }, */
                    controller: controller.passwordController,

                    // keyboardType: TextInputType.,
                  ),
                  30.height,
                ],
              ),
            ),
            15.height,
            InkWell(
              onTap: () {
                appRoute.push(const ForgotPasswordRoute());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Forgot password',
                        style: TextStyle(
                          color: AppPalette.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.14,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.14,
                        ),
                      ),
                      TextSpan(
                        text: 'Click here?',
                        style: TextStyle(
                          color: AppPalette.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),

            /*   Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  //  controller.gotoForgotPassword();
                },
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 16,
                      fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.white /*   color: ThemeConfig.primaryColor */
                      ),
                ),
              ),
            ), */
            15.height,
            AppElevatedButton(
              color: AppPalette.white,
              textColor: AppPalette.primary.primary400,
              height: 56,
              text: 'Log in',
              onPressed: () {
                controller.gotoHomeScreen(context);
                // controller.loginNetwork(context);
              },
              /*  textStyle: context.theme.appTextTheme.labelLarge12.copyWith(
                  color: AppPalette.white, fontWeight: FontWeight.w400), */
            ),
            24.height,
            /*  InkWell(
              onTap: () {
                /*  OnboardingBindings().dependencies();
                appRoute.push(const RegistrationRoute()); */
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Don\'t have account?',
                        style: TextStyle(
                          color: AppPalette.primary.primary100,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.14,
                        ),
                      ),
                      const TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: AppPalette.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            )
          */
          ],
        ),
      ),
    ));
  }
}
