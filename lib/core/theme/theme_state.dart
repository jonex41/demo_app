part of 'theme_notifier.dart';

@freezed
class ThemesState with _$ThemesState {
  const factory ThemesState(
      {ThemeMode? myTheme,
      Key? key,
      GlobalKey<NavigatorState>? navigatorKey}) = _ThemesState;
}
