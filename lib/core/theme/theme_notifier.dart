import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';


part 'theme_notifier.freezed.dart';
part 'theme_state.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemesState>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemesState> {
  ThemeNotifier()
      : super(ThemesState(
            myTheme: ThemeMode.system,
            key: UniqueKey(),
            navigatorKey: GlobalKey<NavigatorState>()));

  ThemeMode themeMode() {
    // _themeMode = themeMode;
    state = state.copyWith(myTheme: ThemeMode.system);
    return state.myTheme!;
  }
}
