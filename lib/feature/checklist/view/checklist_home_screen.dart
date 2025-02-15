import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class ChecklistHomeScreen extends StatefulWidget {
  const ChecklistHomeScreen({super.key});

  @override
  State<ChecklistHomeScreen> createState() => _ChecklistHomeScreenState();
}

class _ChecklistHomeScreenState extends State<ChecklistHomeScreen> {
  final checklistController =
      Get.put<ChecklistController>(ChecklistController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            '100 Days Checklist',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppPalette.backgroundGreen,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () => appRoute.pop(),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/back.svg",
                    colorFilter: const ColorFilter.mode(
                        AppPalette.white, BlendMode.srcIn)),
              ),
            ),
          )),
      body: Container(
        color: AppPalette.backgroundGreen,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              33.height,
              Text(
                'New patient',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  color: AppPalette.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              5.height,
              Text(
                'Get started for to update your personal information',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontSize: 13,
                  color: AppPalette.grayLight6,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    30.height,
                    Center(
                      child: SvgPicture.asset(
                        height: 250,
                        width: 250,
                        "assets/icons/logo_checklist.svg",
                      ),
                    ),
                    38.height,
                    ChecklistItem(
                      title: 'Start a New Checklist',
                      onTap: () {
                        checklistController.gotoAddNewChecklistScreen();
                      },
                    ),
                    21.height,
                    ChecklistItem(
                      title: 'Records (Update,view)',
                      onTap: () {},
                    ),
                    21.height,
                    ChecklistItem(
                      title: 'Schedules',
                      onTap: () {},
                    ),
                    21.height,
                    ChecklistItem(
                      title: 'Logs',
                      onTap: () {},
                    ),
                    21.height
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChecklistItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ChecklistItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppPalette.containerGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  color: AppPalette.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppPalette.white,
                size: 20,
              )
            ],
          )),
    );
  }
}
