import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/feature/onboarding/provider/onboarding_binding.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
    final storageService = Get.find<StorageService>();
  Future<void> gotoGetStarted() async {
    OnboardingBindings().dependencies();
    Future.delayed(const Duration(seconds: 3), () {
    /*   return appRoute.pushAndPopUntil(
        const GetStartedRoute(),
        predicate: (_) => false,
      ); */
       if (storageService.getHasLogin() ?? false) {
        HomeBindings().dependencies();
        return appRoute.replaceAll([const DashboardRoute()]);
      }
      return appRoute.pushAndPopUntil(
        const GetStartedRoute(),
        predicate: (_) => false,
      ); 
    });
  }

  Future<void> gotoPartnersScreen() async {
    OnboardingBindings().dependencies();
    Future.delayed(const Duration(seconds: 3), () {
      return appRoute.pushAndPopUntil(
        const PartnersRoute(),
        predicate: (_) => false,
      );
    });
  }
}
