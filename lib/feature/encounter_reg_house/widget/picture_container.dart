import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../core/theme/new_theme/app_color.dart';

class PictureContainer extends StatelessWidget {
  const PictureContainer({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // radius of 10
            color: const Color(0xffFCE2FF),
            // green as background color
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 64,
              width: 64,
              decoration: const BoxDecoration(
                color: Color(0xffD72FEB),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  name.substring(0, 1),
                  style: context.theme.appTextTheme.titleSmall24.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppPalette.grey.gray50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
