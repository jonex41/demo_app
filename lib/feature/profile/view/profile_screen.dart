import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/profile/provider/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                  10.width,
                  Text(
                    'Profile',
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.center,
                  child: Assets.icons.profileGuy.image()),
              15.height,
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aguda John',
                      style: context.theme.appTextTheme.labelLarge12.copyWith(
                          color: AppPalette.black, fontWeight: FontWeight.w400),
                    ),
                    5.height,
                    Text(
                      'Babatundeayinla17@gmail.com',
                      style: context.theme.appTextTheme.labelLarge12.copyWith(
                          color: AppPalette.grayNew1,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              20.height,
              _card(context, Assets.icons.call.svg(), "07010261589"),
              20.height,
              _card(context, Assets.icons.gender.svg(), "Male"),
              20.height,
              _card(context, Assets.icons.dateBirth.svg(), "20th, Dec 2024"),
              20.height,
              _card(context, Assets.icons.state.svg(), "Ogun State"),
              20.height,
              _card(
                  context, Assets.icons.community.svg(), "Mainland Community"),
              20.height,
              _card(context, Assets.icons.location.svg(),
                  "Waterfront Settlement"),
              20.height,
              _card(context, Assets.icons.ward.svg(), "Ward G"),
              20.height,
            ],
          ),
        ),
      ),
    ));
  }

  _card(BuildContext context, SvgPicture image, String s) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFBFBFB), // Background color (optional)
        border: Border.all(
          color: const Color(0xffECECEC), // White border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      padding:
          const EdgeInsets.all(16.0), // Optional padding inside the container
      child: Row(
        children: [
          image,
          30.width,
          Text(
            s,
            style: context.theme.appTextTheme.bodyLarge18.copyWith(
                color: AppPalette.grayNew1,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
