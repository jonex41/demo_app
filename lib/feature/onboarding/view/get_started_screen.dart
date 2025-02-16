import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

@RoutePage()
class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final List<String> imageUrls = [
    'assets/images/onboard1.png',
    'assets/images/onboard2.png',
    'assets/images/onboard3.png',
    'assets/images/onboard4.png',
    'assets/images/onboard5.png',
  ];
  int _currentImageIndex = 0;
  Timer? _timer;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        _opacity = 0.0;
      });
      Timer(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            if (_currentImageIndex < imageUrls.length - 1) {
              _currentImageIndex++;
            } else {
              _currentImageIndex = 0;
            }
            _opacity = 1.0;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: AppPalette.primary.primary400),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: size.width,
                      height: size.height / 2 + 200,
                      child: AnimatedOpacity(
                        opacity: _opacity,
                        duration: const Duration(seconds: 5),
                        child: Image.asset(imageUrls[_currentImageIndex],
                            fit: BoxFit.fill),
                      )),
                ],
              ),
            ),
            Positioned(
              top: size.height / 2 + 50,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 48),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: AppPalette.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: -5,
                    ),
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 25,
                      offset: Offset(0, 20),
                      spreadRadius: -5,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 277,
                              child: Text(
                                'More than 1000 trusted health workers are here ',
                                textAlign: TextAlign.center,
                                style: context.theme.appTextTheme.bodyLarge18
                                    .copyWith(
                                  color: AppPalette.primary.primary400,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: 300,
                              child: Text(
                                'Embark on a transformative healthcare journey with our comprehensive app',
                                textAlign: TextAlign.center,
                                style: context.theme.appTextTheme.labelLarge12
                                    .copyWith(
                                  color: AppPalette.grey.grey500,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.60,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        ElevatedButton(
                            onPressed: () {
                              appRoute.push(const LoginRoute());

                              // OnboardingBindings().dependencies();
                              // appRoute.push(const AccountVerificationRoute());
                              /* LoginBindings().dependencies();
                              appRoute.push(const LoginRoute()); */
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: AppPalette.white,
                                backgroundColor: AppPalette.primary.primary400,
                                padding: const EdgeInsets.all(20.0),
                                fixedSize: const Size(180, 55),
                                textStyle: context
                                    .theme.appTextTheme.bodyMedium16
                                    .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        color: AppPalette.white,
                                        fontWeight: FontWeight.w700),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: AppPalette.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppPalette.white,
                                  size: 16,
                                )
                              ],
                            )),
                      ],
                    ),
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
