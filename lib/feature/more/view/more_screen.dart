import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';
import '../../../core/theme/new_theme/app_color.dart';
import '../provider/more_controller.dart';

@RoutePage()
class MoreScreen extends GetView<MoreController> {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "More",
                style: context.theme.appTextTheme.titleSmall24.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            20.height,
            InkWell(
              onTap: () {
                // controller.gotoProfile();
              },
              child: _myHeader(
                  context, "Usman Fori", "contactusmanfori@gmail.come"),
            ),
            /*   InkWell(
                onTap: () {
                  controller.gotoMessage();
                },
                child: _eachItem(
                    context, Assets.images.icons.chat.path, "Message")), */
            InkWell(
                onTap: () {
                  appRoute.push(const ProfileRoute());
                  //  controller.gotoLogin();
                },
                child: _eachItem(
                    context,
                    const Icon(
                      Icons.person,
                      color: Color(0xff7A7C7F),
                    ),
                    "View Profile")),
            InkWell(
                onTap: () {
                  appRoute.push(const LoginRoute());
                },
                child: _eachItem(context,
                    SvgPicture.asset(Assets.icons.logout.path), "Logout")),
            const Spacer(),
            AppElevatedButton(
              color: AppPalette.red.red300,
              textColor: AppPalette.white,
              height: 56,
              text: 'Delete Account',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context1) => AlertDialog(
                          title: const Text("Physical Information"),
                          content: const Text(
                              'Are you sure you want to Delete your account?'),
                          actions: [
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () async {
                                appRoute.pop();
                              },
                            ),
                            TextButton(
                              style: const ButtonStyle(),
                              onPressed: () async {
                                /* controller.deleteAccount(
                                    context,
                                    controller.userDetails.value!.id!
                                        .toString()); */
                              },
                              child: const Text("Delete Account"),
                            )
                          ],
                        ));
              },
            ),
            24.height,
          ],
        ),
      ),
    ));
  }

  Widget _myHeader(
    BuildContext context,
    String name,
    String email,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppPalette.grey.gray300, // red as border color
        ),
      ),
      child: Row(
        children: [
          _circleName(
            context,
            name,
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              5.height,
              Text(
                email,
                textAlign: TextAlign.center,
                style: context.theme.appTextTheme.labelLarge12.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppPalette.grey.gray360,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _circleName(BuildContext context, String name) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppPalette.primary.primary100,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: context.theme.appTextTheme.bodyLarge18.copyWith(
              fontWeight: FontWeight.w500, color: AppPalette.grey.gray50),
        ),
      ),
    );
  }

  Widget _eachItem(BuildContext context, Widget widget, String s) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20, right: 10),
      child: Row(
        children: [
          widget,
          20.width,
          Text(
            s,
            style: context.theme.appTextTheme.bodyLarge18.copyWith(
                fontWeight: FontWeight.w500,
                color: s == "Logout"
                    ? AppPalette.red.red350
                    : AppPalette.grey.gray350),
          ),
          const Spacer(),
          if (s != "Logout")
            SvgPicture.asset(
              Assets.icons.rightArrow.path,
            ),
        ],
      ),
    );
  }
}
