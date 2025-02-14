import 'package:flutter/material.dart';

import '../core/theme/new_theme/app_color.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final String text;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double radius;
  final double width;
  final double height;

  const AppElevatedButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.color,
    this.textColor,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w700,
    this.radius = 5.0,
    this.width = 259.0,
    this.height = 60.0,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style ?? _createButtonStyle(),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? AppPalette.white,
              fontSize: fontSize,
              fontWeight: fontWeight),
        ),
      ),
    );
  }

  _createButtonStyle() {
    return ButtonStyle(
      shadowColor: MaterialStateProperty.all(AppPalette.primary.primary400),
      elevation: MaterialStateProperty.all(8.0),
      backgroundColor: MaterialStateProperty.all<Color>(
          color ?? AppPalette.primary.primary400),
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide(color: color ?? AppPalette.primary.primary400),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final String text;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double radius;
  final double width;
  final double height;

  const AppOutlinedButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.color,
    this.textColor,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w700,
    this.radius = 24.0,
    this.width = 259.0,
    this.height = 60.0,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style ?? _createButtonStyle(),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? AppPalette.primary.primary400,
              fontSize: fontSize,
              fontWeight: fontWeight),
        ),
      ),
    );
  }

  _createButtonStyle() {
    return ButtonStyle(
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide(color: color ?? AppPalette.primary.primary400),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final Color? textColor;
  final String background;

  const AppButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.width = 256,
    this.height = 90,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w700,
    this.color,
    this.textColor = AppPalette.black,
    this.background = 'assets/images/btn_bg.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            color: AppPalette.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Image(
                color: color,
                colorBlendMode: BlendMode.srcATop,
                image: AssetImage(background),
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
