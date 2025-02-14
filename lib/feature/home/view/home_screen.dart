import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:demo_app/feature/home/widget/home_header.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
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
            child: Obx(
              () => HomeHeaderWidget(
                name:"Usman Dauda",
                time: controller.greeting(),
                isOnline: true,
              ),
            ),
          ),
         
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              children: [
               
                _firstCard(context),
                //  _secondCard(context),
                _thidCard(context),
                _halfCards(context),
                _fourthCard(
                    context: context,
                    subColor: AppPalette.dark.dark300,
                    cardColor: AppPalette.lime.lime50,
                    title: "Delivery\nreport",
                    showImage: true,
                    fromDelivery: true),
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
      onTap: () {
      
      },
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
                  'First Contact',
                  style: context.theme.appTextTheme.titleSmall24.copyWith(
                      color: AppPalette.primary.primary50,
                      fontWeight: FontWeight.w600),
                ),
                // 10.height,
                Text(
                  'Get started for you to update your\nPatient personal information',
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
                      onTap: () {
                      
                      },
                      child: _buttonWithArrow(
                          context,
                          'Continue',
                          AppPalette.primary.primary400,
                          AppPalette.primary.primary50,
                          16),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Assets.icons.doctorMean
                          .svg(height: 100, width: 100),
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
        color: AppPalette.lime.lime50,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Contact',
                    style: context.theme.appTextTheme.titleSmall24.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Get started for to update your\n personals information',
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
                         
                        },
                        child: _buttonWithArrow(
                            context,
                            'Continue',
                            AppPalette.dark.dark300,
                            AppPalette.lime.lime400,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Assets.icons.doctor2.svg())
            ],
          ),
        ),
      ),
    );
  }

  Widget _thidCard(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: AppPalette.primary.primary50,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Return Contact',
                    style: context.theme.appTextTheme.titleSmall24.copyWith(
                        color: AppPalette.dark.dark60,
                        fontWeight: FontWeight.w600),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        'Assessment of General Well-Being\nand Blood Pressure',
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
                            AppPalette.primary.primary50,
                            AppPalette.primary.primary400,
                            16),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Assets.icons.doctorGreen.svg())
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
        height: 200,
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
                Assets.icons.plug.svg(),
                10.height,
                Text(
                  'Testing',
                  style: context.theme.appTextTheme.titleSmall24.copyWith(
                      color: AppPalette.primary.primary50,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Basic ANC Booking Investigations\ninclude',
                  style: context.theme.appTextTheme.labelLarge8.copyWith(
                      color: AppPalette.primary.primary50,
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
        height: 200,
        child: Card(
          color: AppPalette.lime.lime400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.icons.heartRate.svg(),
                2.height,
                Text(
                  'Care\nProvision',
                  style: context.theme.appTextTheme.titleSmall24.copyWith(
                      color: AppPalette.primary.primary400,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fourthCard(
      {required BuildContext context,
      required Color cardColor,
      required Color subColor,
      required String title,
      required bool showImage,
      required bool fromDelivery}) {
    return SizedBox(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showImage)
                    Text(
                      title,
                      style: context.theme.appTextTheme.headlineMedium32
                          .copyWith(
                              color: AppPalette.dark.dark60,
                              fontWeight: FontWeight.w700),
                    ),
                  if (!showImage)
                    Text(
                      title,
                      style: context.theme.appTextTheme.titleMedium26.copyWith(
                          color: AppPalette.dark.dark60,
                          fontWeight: FontWeight.w700),
                    ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (fromDelivery) {
                           // controller.gotoDeliveryReport();
                          } else {}
                        },
                        child: _buttonWithArrowTwo(
                          context,
                          'View',
                          subColor,
                          cardColor,
                          16,
                        ),
                      ),
                      14.width,
                    ],
                  )
                ],
              ),
              const Spacer(),
              if (showImage)
                Align(
                    alignment: Alignment.bottomRight,
                    child: Assets.icons.paper.svg())
            ],
          ),
        ),
      ),
    );
  }
}


/* 
 appBar: AppBar(
        backgroundColor: context.theme.appColors.primary,
        title: const Text("Optics"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'First screen',
              // Usage of custom typography with text theme extension.
              style: context.theme.appTextTheme.bodyMedium16,
            ),
            Text(
              '1',
              // Usage of custom typography without text theme extension.
              style: AppTypography.h1.copyWith(
                color: context.theme.appColors.primary,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //counter.value++;
          //navigate to another screen
          appRoute.push(const LoginRoute());
        },
        tooltip: 'Increment',
        backgroundColor: context.theme.appColors.primary,
        foregroundColor: context.theme.appColors.onPrimary,
        child: const Icon(Icons.add),
      ), */