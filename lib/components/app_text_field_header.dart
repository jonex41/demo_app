import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTextFieldHeader extends StatelessWidget {
  final String title;
  final bool showCompulsory;
  const AppTextFieldHeader(
      {super.key, required this.title, this.showCompulsory = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                      fontSize: 13,
                      color: AppPalette.black,
                      fontWeight: FontWeight.w400),
                ),
                const TextSpan(
                  text: ' ',
                ),
                showCompulsory == true
                    ? TextSpan(
                        text: '*',
                        style: TextStyle(
                            fontSize: 13,
                            color: AppPalette.red.red300,
                            fontWeight: FontWeight.w500),
                      )
                    : const TextSpan(
                        text: ' ',
                      ),
              ]),
            ))
      ],
    );
  }
}
