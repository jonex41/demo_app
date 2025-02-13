import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';

import '../../../../gen/assets.gen.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        // TransactionRoute(),
        //  ProfileRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: AppPalette.primary.primary400,
            ),
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                backgroundColor: AppPalette.primary.primary400,
                onTap: tabsRouter.setActiveIndex,
                selectedItemColor: AppPalette.white,
                unselectedItemColor: AppPalette.grey.gray400,
                selectedLabelStyle: context.myTheme.appTextTheme.bodySmall14
                    .copyWith(
                        color: AppPalette.primary.primary400,
                        fontWeight: FontWeight.w500),
                unselectedLabelStyle: context.myTheme.appTextTheme.bodySmall14
                    .copyWith(
                        color: AppPalette.grey.gray200,
                        fontWeight: FontWeight.w500),
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon:
                        Assets.icons.person.svg(color: AppPalette.grey.gray400),
                    activeIcon:
                        Assets.icons.person.svg(color: AppPalette.white),
                    label: 'Home',
                  ),
                  /*   BottomNavigationBarItem(
                    icon: Assets.icons.transaction
                        .svg(color: AppPalette.grey.gray400),
                    activeIcon:
                        Assets.icons.transaction.svg(color: AppPalette.white),
                    label: 'Transaction',
                  ),
                  BottomNavigationBarItem(
                    icon: Assets.icons.profile
                        .svg(color: AppPalette.grey.gray400),
                    activeIcon:
                        Assets.icons.profile.svg(color: AppPalette.white),
                    label: 'Profile',
                  ), */
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
