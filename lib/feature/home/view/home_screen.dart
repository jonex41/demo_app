import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:demo_app/feature/home/widget/home_header.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
              name: "Usman Dauda",
              time: controller.greeting(),
              isOnline: true,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              children: [
                _firstCard(context),
                _secondCard(context),
                _thirdCard(context),
                _fourthCard(context),
                _fifthCard(context),
                _sixthCard(context),
                _seventhCard(context),
                _eigtthCard(context),
                _halfCards(context),
                Assets.images.germanLogo.image(
                  width: (context.width - 20).w,
                ),

                /*   _fourthCard(
                    context: context,
                    subColor: AppPalette.dark.dark300,
                    cardColor: AppPalette.lime.lime50,
                    title: "Delivery\nreport",
                    showImage: true,
                    fromDelivery: true), */
                /*    _fourthCard(
                    context: context,
                    cardColor: AppPalette.primary.primary60,
                    subColor: AppPalette.primary.primary400,
                    title: "Immunizations and\nOther Prophylaxis",
                    showImage: false,
                    fromDelivery: false), */

                50.height,
                /*  Align(
                    alignment: Alignment.bottomLeft,
                    child: Assets.images.icons.partnerDash.image()) */
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
                  'Getting ready for ANC clinical consultations',
                  style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      color: AppPalette.primary.primary10,
                      fontWeight: FontWeight.w600),
                ),
                // 10.height,
                /*   Text(
                  'Get started for you to update your\nPatient personal information',
                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                      color: AppPalette.primary.primary50,
                      fontWeight: FontWeight.w600),
                ), */
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
                          'Begin ANC Consultation',
                          AppPalette.primary.primary400,
                          AppPalette.primary.primary10,
                          16),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child:
                          Assets.icons.doctorMean.svg(height: 100, width: 100),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonWithArrow(BuildContext context, String name, Color textColor,
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
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize),
            ),
            5.width,
            Icon(
              Icons.arrow_forward_ios_rounded,
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
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
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
                      30.width
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
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
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
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
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
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
                          //  controller.gotoEveryScreen();
                          // controller.gotoGettingReady();
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
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
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
                    'Referral Form ',
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.dark.dark60,
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
}
