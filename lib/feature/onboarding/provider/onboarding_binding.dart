import 'package:demo_app/feature/onboarding/provider/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<OnboardingController>(OnboardingController());
  }
}
