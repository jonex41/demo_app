import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class MaterDetailsScreen extends StatelessWidget {
  const MaterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      appRoute.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Assets.icons.backPage.svg(
                        height: 30,
                        width: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  20.width,
                  Text(
                    "Anwar Hausa",
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              // 15.height,
              // Tabs
              /*   Row(
                children: [
                  _tabItem("Maternal Details", isActive: true),
                  const SizedBox(width: 16),
                  _tabItem("Maternal & Postnatal", isActive: false),
                ],
              ), */
              // const SizedBox(height: 10),
              20.height,
              // Form Content
              Expanded(
                child: ListView(
                  children: [
                    _formField("Settlement", "Angwar Hausa"),
                    _doubleField("House No", "Household No",
                        "CHIPS/260102/01/01", "CHIPS/260102/01/01002"),
                    _formField("Pregnant Woman’s Name", "Aina, Adaeze C"),
                    _formField("Phone Number", "08037867439"),
                    _formField("Age", "32"),
                    _formField("Date Registered by CHIPS Agent", "12/02/2025"),
                    _formField("Expected Date of Delivery", "12/02/2025"),
                    _formField("Home Visits During Pregnancy", "2"),
                    _doubleField(
                        "1 visit", "2 visit", "12/02/2025", "12/02/2025"),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AppElevatedButton(
                  width: double.infinity,
                  textColor: AppPalette.white,
                  color: AppPalette.primary.primary400,
                  height: 56,
                  text: 'Download Pdf',
                  onPressed: () {
                    //controller.gotoHomeScreen(context);
                    //  controller.loginNetwork(context);
                  },
                  /*  textStyle: context.theme.appTextTheme.labelLarge12.copyWith(
                    color: AppPalette.white, fontWeight: FontWeight.w400), */
                ),
              ),
              10.height,
              Align(
                alignment: Alignment.center,
                child: AppElevatedButton(
                  width: double.infinity,
                  color: AppPalette.white,
                  textColor: AppPalette.primary.primary400,
                  height: 56,
                  text: 'Delete Form',
                  onPressed: () {
                    //controller.gotoHomeScreen(context);
                    //  controller.loginNetwork(context);
                  },
                  /*  textStyle: context.theme.appTextTheme.labelLarge12.copyWith(
                    color: AppPalette.white, fontWeight: FontWeight.w400), */
                ),
              ),
              20.height
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem(String title, {bool isActive = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.green : Colors.grey,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 3,
            width: 80,
            color: Colors.green,
          ),
      ],
    );
  }

  Widget _formField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "$label ",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              children: const [
                TextSpan(
                  text: "*",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _doubleField(
      String label1, String label2, String value1, String value2) {
    return Row(
      children: [
        Expanded(child: _formField(label1, value1)),
        const SizedBox(width: 16),
        Expanded(child: _formField(label2, value2)),
      ],
    );
  }
}
