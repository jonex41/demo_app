import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/profile/provider/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';
import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

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
        ),
        actions: [
          InkWell(
            onTap: () {
              controller.gotoEditProfileScreen();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset("assets/icons/edit_profile.svg",
                  colorFilter: const ColorFilter.mode(AppPalette.black, BlendMode.srcIn)),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(alignment: Alignment.center, child: Assets.icons.profileGuy.image()),
              15.height,
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aguda John',
                      style: context.theme.appTextTheme.labelLarge12
                          .copyWith(color: AppPalette.black, fontWeight: FontWeight.w400),
                    ),
                    5.height,
                    Text(
                      'Babatundeayinla17@gmail.com',
                      style: context.theme.appTextTheme.labelLarge12
                          .copyWith(color: AppPalette.grayNew1, fontWeight: FontWeight.w400),
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
              _card(context, Assets.icons.community.svg(), "Mainland Community"),
              20.height,
              _card(context, Assets.icons.location.svg(), "Waterfront Settlement"),
              20.height,
              _card(context, Assets.icons.ward.svg(), "Ward G"),
              20.height,
            ],
          ),
        ),
      ),
    );
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
      padding: const EdgeInsets.all(16.0), // Optional padding inside the container
      child: Row(
        children: [
          image,
          30.width,
          Text(
            s,
            style: context.theme.appTextTheme.bodyLarge18
                .copyWith(color: AppPalette.grayNew1, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
