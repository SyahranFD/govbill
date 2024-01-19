import 'package:get/get.dart';
import 'package:govbill/app/pages/onboarding_page/onboarding_page_controller.dart';

class OnboardingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingPageController>(() => OnboardingPageController());
  }
}