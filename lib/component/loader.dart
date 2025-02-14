import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart' as l;

void   showLoaderNew(BuildContext context) {
  l.Loader.show(context,
      progressIndicator: Loader(
        valueColor: const AlwaysStoppedAnimation(blueColor),
      ).visible(true),
      overlayColor: AppPalette.primary.primary200.withOpacity(0.5));
}

void hideLoaderNew() {
  l.Loader.hide();
}
