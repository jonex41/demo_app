import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/get_started_image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    15.height,
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: ElevatedButton(
                          onPressed: () {
                            appRoute.push(const LoginRoute());
                            // OnboardingBindings().dependencies();
                            // appRoute.push(const AccountVerificationRoute());
                            /* LoginBindings().dependencies();
                                appRoute.push(const LoginRoute()); */
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: AppPalette.primary.primary400,
                              backgroundColor: AppPalette.white,
                              padding: const EdgeInsets.all(20.0),
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 55),
                              textStyle: context.theme.appTextTheme.bodyMedium16
                                  .copyWith(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      color: AppPalette.primary.primary400,
                                      fontWeight: FontWeight.w700),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get Started',
                                style: TextStyle(
                                  color: AppPalette.primary.primary400,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppPalette.primary.primary400,
                                size: 16,
                              )
                            ],
                          )),
                    ),
                    50.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
