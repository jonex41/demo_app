import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.path,
    required this.name,
    //   required this.name2,
    required this.textColor,
    required this.bodyColor,
    required this.increase,
  });

  final Widget path;
  final String name;
//  final String name2;
  final Color textColor;
  final Color bodyColor;
  final double? increase;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 2 - 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), // radius of 10
          color: bodyColor // green as background color
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            8.width,
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: textColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: path),
            ),
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: context.myTheme.appTextTheme.bodyMedium16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.jura().fontFamily,
                      fontSize: increase ?? 12.sp,
                      color: AppPalette.white),
                ),
                /*  Text(
                  name2,
                  style: context.myTheme.appTextTheme.bodyMedium16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.jura().fontFamily,
                      fontSize: 14.sp,
                      color: AppPalette.white),
                ), */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
