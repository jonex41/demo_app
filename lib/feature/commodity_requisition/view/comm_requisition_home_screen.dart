import 'package:auto_route/auto_route.dart';
import 'package:demo_app/feature/commodity_requisition/provider/commodity_requisition_controller.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class CommRequisitionHomeScreen extends StatefulWidget {
  const CommRequisitionHomeScreen({super.key});

  @override
  State<CommRequisitionHomeScreen> createState() =>
      _CommRequisitionHomeScreenState();
}

class _CommRequisitionHomeScreenState extends State<CommRequisitionHomeScreen> {
  final controller =
      Get.put<CommodityRequisitionController>(CommodityRequisitionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppPalette.primary.primary70,
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
        color: AppPalette.primary.primary70,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.height,
              Text(
                'Commodity Requisition and \nIssuance',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontSize: 20,
                  color: AppPalette.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              Text(
                'Lorem ipsum dolor sit amet consectetur. Sit cras eros neque posuere ultrices sit habitasse in donec.',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontSize: 14,
                  color: AppPalette.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    15.height,
                    Center(
                        child: Assets.images.firstVisit
                            .svg(width: 250, height: 250)),
                    20.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 10),
                      decoration: BoxDecoration(
                        color: AppPalette.green4,
                        border: Border.all(
                            width: 1.5, color: const Color(0xFF2ECE96)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/profile_icon_bg.svg",
                            ),
                            12.height,
                            Text(
                              'Commodity Requisition and Issuance form',
                              style: context.theme.appTextTheme.bodyMedium16
                                  .copyWith(
                                fontSize: 18,
                                color: AppPalette.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            12.height,
                            InkWell(
                              onTap: () {
                                controller.gotoCommRequisitionDashboardScreen();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 8,
                                          bottom: 8,
                                          right: 16),
                                      decoration: BoxDecoration(
                                        color: AppPalette.green4,
                                        border: Border.all(
                                            width: 1.5,
                                            color: const Color(0xFF2ECE96)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0)),
                                      ),
                                      child: Text(
                                        'View & Fill Form',
                                        style: context
                                            .theme.appTextTheme.bodyMedium16
                                            .copyWith(
                                          fontSize: 14,
                                          color: AppPalette.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ]),
                    ),
                    21.height,
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 10),
                      decoration: BoxDecoration(
                        color: AppPalette.green4,
                        border: Border.all(
                            width: 1.5, color: const Color(0xFF2ECE96)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Edit Saved Form',
                              style: context.theme.appTextTheme.bodyMedium16
                                  .copyWith(
                                fontSize: 14,
                                color: AppPalette.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppPalette.white,
                              size: 16,
                            )
                          ]),
                    ),
                    21.height,
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
