import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:demo_app/feature/home/widget/home_header.dart';
import 'package:demo_app/feature/offline/provider/offline_controller.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

//  Assets.images.image1.svg(),

@RoutePage()
class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: HomeHeaderWidget(
              name:
                  "${controller.loginModel.value?.firstName} ${controller.loginModel.value?.lastName}",
              time: controller.greeting(),
              isOnline: true,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              children: [
                //page1(context),
                page2(context),
                50.height,
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _firstCard(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: AppPalette.primary.primary400,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settlement Registry',
                  style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      color: AppPalette.primary.primary10,
                      fontWeight: FontWeight.w600),
                ),
                10.height,
                Text(
                  'Create community and settlement profile',
                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                      color: AppPalette.primary.primary50,
                      fontWeight: FontWeight.w600),
                ),
                // 30.width,
                /*  Text(
                  'Getting ready for ANC clinical\n consultations',
                  style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      color: AppPalette.primary.primary50,
                      fontWeight: FontWeight.w600),
                ), */

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: _buttonWithArrow(
                          context,
                          'Continue',
                          AppPalette.primary.primary400,
                          AppPalette.primary.primary10,
                          16),
                    ),
                    const Spacer(),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 80.w,
                            width: 80.w,
                            color: AppPalette.cardeight1,
                            child: const Center(
                                child: Icon(
                              Icons.location_on_outlined,
                              size: 50,
                              color: Colors.white,
                            )))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _card(
    BuildContext context,
    String s,
    String buttonName,
    Icon image,
    Color container,
    Color border,
    bool showButton,
  ) {
    return Container(
        width: double.infinity,
        height: context.height / 4.5,
        decoration: BoxDecoration(
          color: container,
          border: Border.all(
            color: border, // White border color
            width: 1.0, // Border width
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding: const EdgeInsets.all(16.0),
        // Optional padding inside the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: container,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(
                        color: container,
                        border: Border.all(
                          color: border, // White border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                      ),
                      height: 40.w,
                      width: 40.w,
                      // color: container,
                      child: Center(child: image))),
            ),
            5.height,
            Text(
              s,
              style: context.theme.appTextTheme.bodySmall14.copyWith(
                  color: AppPalette.black2, fontWeight: FontWeight.w600),
            ),
            5.height,
            Text(
              buttonName,
              style: context.theme.appTextTheme.labelLarge12.copyWith(
                  color: AppPalette.black, fontWeight: FontWeight.w400),
            ),
            if (showButton)
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    //  width: context.width / 2.5,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Background color (optional)
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 0.5, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            //  controller.gotoEveryScreen();
                            // controller.gotoGettingReady();
                          },
                          child: _buttonWithArrow(
                              context,
                              "Get Started",
                              AppPalette.primary.primary10,
                              AppPalette.primary.primary400,
                              16),
                        ),
                        14.width,
                      ],
                    )),
              )
          ],
        ));
  }

  _card2(BuildContext context, String s, String buttonName, Icon image,
      Color container, Color border, bool showButton, String buttonText,
      {required Function() onTap}) {
    return Container(
        width: double.infinity,
        height: context.height / 4.0,
        decoration: BoxDecoration(
          color: container,
          border: Border.all(
            color: border, // White border color
            width: 1.0, // Border width
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding: const EdgeInsets.all(14.0),
        // Optional padding inside the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: container,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(
                        color: AppPalette.primary.primary50,
                        border: Border.all(
                          color: border, // White border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                      ),
                      height: 40.w,
                      width: 40.w,
                      // color: container,
                      child: Center(child: image))),
            ),
            5.height,
            Text(
              s,
              style: context.theme.appTextTheme.bodySmall14.copyWith(
                  color: AppPalette.white, fontWeight: FontWeight.w600),
            ),
            5.height,
            Text(
              buttonName,
              style: context.theme.appTextTheme.labelLarge12.copyWith(
                  color: AppPalette.white, fontWeight: FontWeight.w400),
            ),
            5.height,
            if (showButton)
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    //  width: context.width / 2.5,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color (optional)
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 0.5, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(14.0), // Rounded corners
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            onTap.call();
                            //  controller.gotoEveryScreen();
                            // controller.gotoGettingReady();
                          },
                          child: _buttonWithArrow(
                              context,
                              buttonText,
                              AppPalette.primary.primary400,
                              AppPalette.white,
                              14),
                        ),
                        14.width,
                      ],
                    )),
              )
          ],
        ));
  }

  Widget _buttonWithArrow(BuildContext context, String name, Color textColor,
      Color containerColor, double fontSize) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // radius of 10
            color: containerColor // green as background color
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: context.theme.appTextTheme.bodyLarge18.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize),
            ),
            5.width,
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: textColor,
            )
            //Assets.images.icons.wave.image(),
          ],
        ));
  }

  Widget _buttonWithArrowTwo(BuildContext context, String name, Color textColor,
      Color containerColor, double fontSize) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // radius of 10
            color: containerColor // green as background color
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: context.theme.appTextTheme.bodyLarge18.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize),
            ),
            5.width,
            Icon(
              Icons.arrow_forward,
              color: textColor,
            )
            //Assets.images.icons.wave.image(),
          ],
        ));
  }

  Widget _secondCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.lime,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1000 days checklist',
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update\nyour personals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.grey.gray400,
                            fontWeight: FontWeight.w500),
                      ),
                      30.width
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.gotoChecklistHomeScreen();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary10,
                            AppPalette.button1,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 80.w,
                    width: 80.w,
                    color: AppPalette.lime2,
                    child: Center(child: Assets.images.check1000.image()),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _secondCard2(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.lime,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settlement Registry',
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update\nyour personals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.grey.gray400,
                            fontWeight: FontWeight.w500),
                      ),
                      30.width
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.gotoSettlementRegistryScreen();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary10,
                            AppPalette.button1,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 80.w,
                    width: 80.w,
                    color: AppPalette.lime2,
                    child: Center(child: Assets.images.check1000.image()),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _thirdCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.primary.primary10,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Commodity Dispensing\nForm',
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update\nyour personals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.grey.gray400,
                            fontWeight: FontWeight.w500),
                      ),
                      10.width,
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.gotoCommDispenseHomeScreen();
                          //  controller.gotoEveryScreen();
                          // controller.gotoGettingReady();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary10,
                            AppPalette.primary.primary400,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 80.w,
                      width: 80.w,
                      color: AppPalette.green1,
                      child: Center(
                          child: Assets.images.comodityDispense.image()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fourthCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.orangeLight1,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Commodity Requisition\nand Issuance form',
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update your\npersonals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.grey.gray400,
                            fontWeight: FontWeight.w500),
                      ),
                      10.width,
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.gotoCommRequisitionHomeScreen();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary10,
                            AppPalette.button3,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 80.w,
                      width: 80.w,
                      color: AppPalette.orangeLight2,
                      child: Center(
                          child: Assets.images.comodityRequisition.image()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fifthCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.cloud1,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Encounter Register\nmaternal & Childhealth',
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update\nyour personals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.grey.gray400,
                            fontWeight: FontWeight.w500),
                      ),
                      10.width,
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          appRoute.push(const EncouterRegMatRoute());
                          //  controller.gotoEveryScreen();
                          // controller.gotoGettingReady();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary10,
                            AppPalette.button4,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 80.w,
                      width: 80.w,
                      color: AppPalette.cloud2,
                      child: Center(child: Assets.images.commodity2.image()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sixthCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.cardsix1,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Encounter Register\nHousehold ',
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update\nyour personals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.grey.gray400,
                            fontWeight: FontWeight.w500),
                      ),
                      10.width,
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          appRoute.push(const EncouterRegHouseRoute());
                          //  controller.gotoEveryScreen();
                          // controller.gotoGettingReady();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary10,
                            AppPalette.cardsix3,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 80.w,
                      width: 80.w,
                      color: AppPalette.cardsix2,
                      child: Center(
                          child: Assets.images.encouterRegisterHousehold
                              .image()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _seventhCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.cardseven1,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'House Register',
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w800),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update your\npersonals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.primary.primary10,
                            fontWeight: FontWeight.w500),
                      ),
                      10.width,
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          appRoute.push(const HouseHoldRegRoute());
                          //  controller.gotoEveryScreen();
                          // controller.gotoGettingReady();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary10,
                            AppPalette.primary.primary400,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 80.w,
                      width: 80.w,
                      color: AppPalette.cardseven2,
                      child:
                          Center(child: Assets.images.houseRegister.image()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _eigtthCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.primary.primary400,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Referral Form ',
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.primary.primary10,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update your\npersonals information',
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: AppPalette.primary.primary10,
                            fontWeight: FontWeight.w500),
                      ),
                      10.width,
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          appRoute.push(const ChipReferralRoute());
                          //  controller.gotoEveryScreen();
                          // controller.gotoGettingReady();
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.primary.primary400,
                            AppPalette.white,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 80.w,
                      width: 80.w,
                      color: AppPalette.cardeight1,
                      child:
                          Center(child: Assets.images.referralForm.image()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _halfCards(BuildContext context) {
    return Row(
      children: [
        _halfCardOne(context),
        _halfCardTwo(context),
      ],
    );
  }

  Widget _halfCardOne(BuildContext context) {
    return InkWell(
      onTap: () {
        appRoute.push(const WalletRoute());

        //  controller.gotoTestingPage();
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 15,
        height: 210,
        child: Card(
          color: AppPalette.primary.primary400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: AppPalette.primary.primary10,
                      child: Center(
                        child: Assets.images.wallet.image(),
                      ),
                    )),
                10.height,
                Text(
                  'Wallet',
                  style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      color: AppPalette.primary.primary10,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Basic ANC Booking Investigations\ninclude',
                  style: context.theme.appTextTheme.labelLarge8.copyWith(
                      color: AppPalette.primary.primary10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _halfCardTwo(BuildContext context) {
    return InkWell(
      onTap: () {
        appRoute.push(const ProfileRoute());
        // controller.gotoCareProvider();
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 15,
        height: 210,
        child: Card(
          color: AppPalette.lime1.lime400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: AppPalette.primary.primary10,
                      child: Center(
                        child: Assets.images.profileNew.image(),
                      ),
                    )),
                2.height,
                Text(
                  'Profile',
                  style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      color: AppPalette.primary.primary400,
                      fontWeight: FontWeight.w600),
                ),
                10.height,
                Text(
                  'Basic ANC Booking\nInvestigations include',
                  style: context.theme.appTextTheme.labelLarge8.copyWith(
                      color: AppPalette.primary.primary400,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget page1(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Overview of collected and pending data',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                fontWeight: FontWeight.w600, color: const Color(0xff2C2D33)),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Monitor your submissions and pending syncs',
            style: context.theme.appTextTheme.bodySmall14.copyWith(
                fontWeight: FontWeight.w400, color: const Color(0xff8B8D97)),
          ),
        ),
        20.height,
        GestureDetector(
          child: Obx(() => _card(
              context,
              "Total Submissions",
              controller.submittedList.value.toString(),
              Icon(Icons.feed_outlined, color: AppPalette.primary.primary400),
              const Color(0xffEEFFF9),
              const Color(0xff2fcf9733).withOpacity(0.2),
              false)),
        ),
        20.height,
        GestureDetector(
          child: Obx(() => _card(
              context,
              "Pending Sync",
              controller.pendingSync.value.toString(),
              const Icon(Icons.schedule, color: Color(0xffEE6471)),
              const Color(0xffFFF7F2),
              const Color(0xffee647133).withOpacity(0.2),
              false)),
        ),
        20.height,
        GestureDetector(
          child: _card2(
            context,
            "Start new form entry",
            "Start a new form entry to collect and save data seamlessly, even offline.",
            Icon(Icons.add_box_outlined, color: AppPalette.primary.primary400),
            const Color(0xff027D52),
            Colors.white,
            true,
            "Get Started",
            onTap: () {
              controller.gotoIEVDataHomeScreen();
            },
          ),
        ),
        20.height,
        GestureDetector(
            child: _card2(
          context,
          "View Records",
          "View form entry to collected and saved.",
          Icon(Icons.add_box_outlined, color: AppPalette.primary.primary400),
          const Color(0xff027D52),
          Colors.white,
          true,
          "View Records",
          onTap: () {
            Get.find<OfflineController>().isOnline.value = true;
            Get.find<OfflineController>().getDataOnline();
            appRoute.push(const AllRecordIevRoute());
          },
        )),
      ],
    );
  }

  Widget page2(BuildContext context) {
    return Column(
      children: [
        _secondCard(context),
        _thirdCard(context),
        _fourthCard(context),
        _fifthCard(context),
        _sixthCard(context),
        _seventhCard(context),
        _eigtthCard(context),
        _secondCard2(context),
        _halfCards(context),
        20.height,
        _firstCard(context),
      ],
    );
  }
}
