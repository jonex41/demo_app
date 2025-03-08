import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/util/utils.dart';
import 'package:demo_app/feature/wallet/provider/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../../gen/assets.gen.dart';

import '../../../core/theme/new_theme/app_color.dart';

@RoutePage()
class WalletScreen extends GetView<WalletController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            //  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
            children: [
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
                    'Wallet',
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        color: AppPalette.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              6.height,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please enter your login details',
                  style: context.theme.appTextTheme.labelLarge12.copyWith(
                      color: AppPalette.white, fontWeight: FontWeight.w400),
                ),
              ),
              15.height,
              _topCard(context),
              20.height,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Quick Links',
                  style: context.theme.appTextTheme.bodyMedium16.copyWith(
                      color: AppPalette.grayNew1, fontWeight: FontWeight.w600),
                ),
              ),
              15.height,
              _quickLinks(context),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: context.myTheme.appTextTheme.bodyMedium16.copyWith(
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: AppPalette.black),
                  ),
                  _seeMore(context, "See all")
                ],
              ),
              10.height,
              _singleTransaction(context, true, "Transfer to Hauwa"),
              10.height,
              _singleTransaction(context, false, "Recieved from Opticcs"),
              10.height,
              _singleTransaction(context, false, "Recieved from Opticcs"),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _topCard(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
            ),
            child: Container(
                width: context.width - 30,
                height: 220,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0)),
                    color: Color(0xff027D52) // green as background color
                    ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 15.w, right: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*   Align(
                            alignment: Alignment.bottomRight,
                            child: Assets.icons.person.svg()), */
                        10.height,
                        Text(
                          "Account Balance",
                          style: context.myTheme.appTextTheme.bodySmall14
                              .copyWith(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: AppPalette.white),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  NaireText(context,
                                      textColor: AppPalette.white,
                                      weight: FontWeight.w800,
                                      size: 30),
                                  Text(
                                    formatMoney("300000"),
                                    style: context
                                        .myTheme.appTextTheme.headlineSmall30
                                        .copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: AppPalette.white),
                                  ),
                                ],
                              ),
                              Obx(
                                () => InkWell(
                                  onTap: () {},
                                  //child: Assets.icons.eyeOpen.image()
                                  child: controller.showBalance.value
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Colors.white,
                                        )
                                      : const Icon(Icons.visibility_outlined,
                                          color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Clipboard.setData(const ClipboardData(
                                          text: "8946632893"))
                                      .then((_) {
                                    toast("Wallet Id Copied");
                                  });
                                },
                                child: const Icon(
                                  Icons.copy,
                                  color: Colors.white,
                                )),
                            8.width,
                            Text(
                              "8946632893",
                              style: context.myTheme.appTextTheme.bodySmall14
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: AppPalette.white),
                            ),
                          ],
                        ),
                        20.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            moneyCard(context, "Withdraw",
                                Assets.icons.withdraw.svg()),
                            10.width,
                            moneyCard(context, "Transfer",
                                Assets.icons.transfer1.svg()),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
        10.height,
      ],
    );
  }

  moneyCard(BuildContext context, String s, SvgPicture svg) {
    return Container(
      width: context.width / 3,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3), // Background color (optional)

        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      padding:
          const EdgeInsets.all(16.0), // Optional padding inside the container
      child: Center(
        child: Row(
          children: [
            Text(
              s,
              style: const TextStyle(color: Colors.white),
            ),
            10.width,
            svg
          ],
        ),
      ),
    );
  }

  _seeMore(
    BuildContext context,
    String s,
  ) {
    return Container(
      width: context.width / 3,

      decoration: BoxDecoration(
        color: const Color(0xff117c53)
            .withOpacity(0.1), // Background color (optional)

        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 5), // Optional padding inside the container
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              s,
              style: const TextStyle(color: Colors.black),
            ),
            10.width,
            const Icon(Icons.arrow_right_alt_sharp)
          ],
        ),
      ),
    );
  }

  Widget _quickLinks(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xffE8FFF7), // Background color (optional)
          border: Border.all(
            color: const Color(0xffCDF2E4), // White border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        padding:
            const EdgeInsets.all(16.0), // Optional padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _singleQiuckLink(
                context, "Bank Account", Assets.icons.bankAccount.svg()),
            _singleQiuckLink(context, "Buy Data", Assets.icons.buyData.svg()),
            _singleQiuckLink(context, "Pin Set", Assets.icons.pinSet.svg()),
            _singleQiuckLink(context, "Topup", Assets.icons.topup.svg()),
          ],
        ));
  }

  _singleQiuckLink(BuildContext context, String s, SvgPicture svg) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 60.w,
              width: 60.w,
              color: const Color(0xff027D52).withOpacity(0.1),
              child: Center(child: svg),
            )),
        20.height,
        Text(
          s,
          style: context.myTheme.appTextTheme.labelLarge12.copyWith(
              fontWeight: FontWeight.w300,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppPalette.black),
        ),
      ],
    );
  }

  _singleTransaction(BuildContext context, bool value, String s) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color (optional)
          border: Border.all(
            color: const Color(0xffF2F2F2), // White border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding:
            const EdgeInsets.all(16.0), // Optional padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 50.w,
                      width: 50.w,
                      color: AppPalette.lime2,
                      child: Center(
                          child: value
                              ? Assets.icons.debitArrow.svg()
                              : Assets.icons.creditArrow.svg()),
                    )),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      s,
                      style: context.myTheme.appTextTheme.labelLarge12.copyWith(
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: AppPalette.black),
                    ),
                    Text(
                      "14 Feb, 2025 - 08:45 PM",
                      style: context.myTheme.appTextTheme.labelLarge10.copyWith(
                          fontWeight: FontWeight.w300,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: AppPalette.black),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                NaireText(context,
                    textColor: AppPalette.black,
                    weight: FontWeight.w400,
                    size: 12),
                Text(
                  formatMoney("45890"),
                  style: context.myTheme.appTextTheme.labelLarge12.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: AppPalette.black),
                ),
              ],
            ),
          ],
        ));
  }
}
