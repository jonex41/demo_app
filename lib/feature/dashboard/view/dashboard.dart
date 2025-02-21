import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/offline/view/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../../gen/assets.gen.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        OfflineRoute(),
        ActivityRoute(),
        MoreRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          /* appBar: AppBar(
              title: Text(context.topRoute.name),
              leading: const AutoLeadingButton()), */
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: AppPalette.primary.primary400,
            unselectedItemColor: AppPalette.grey.gray400,
            selectedLabelStyle: context.theme.appTextTheme.bodySmall14.copyWith(
                color: AppPalette.primary.primary400,
                fontWeight: FontWeight.w500),
            unselectedLabelStyle: context.theme.appTextTheme.bodySmall14
                .copyWith(
                    color: AppPalette.grey.gray200,
                    fontWeight: FontWeight.w500),
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Assets.icons.home.svg(),
                activeIcon:
                    Assets.icons.home.svg(color: AppPalette.primary.primary400),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.poll_outlined,
                  color: Color(0xff929BAB),
                ),
                activeIcon: Icon(
                  Icons.poll_outlined,
                  color: AppPalette.primary.primary400,
                ),
                label: 'Offline Data',
              ),
              /*  BottomNavigationBarItem(
                icon: Assets.images.icons.draft.svg(),
                activeIcon: Assets.images.icons.draft
                    .svg(color: AppPalette.primary.primary400),
                label: 'Draft',
              ), */
              BottomNavigationBarItem(
                icon: Assets.icons.activity.svg(),
                activeIcon: Assets.icons.activity
                    .svg(color: AppPalette.primary.primary400),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.more.svg(),
                activeIcon:
                    Assets.icons.more.svg(color: AppPalette.primary.primary400),
                label: 'More',
              ),
            ],
          ),
        );
      },
    );
  }
}
