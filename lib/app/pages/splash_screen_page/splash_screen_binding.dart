import 'package:get/get.dart';
import 'package:govbill/app/pages/splash_screen_page/splash_screen_controller.dart';


class SplashScreenPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenPageController>(
          () => SplashScreenPageController(),
    );
  }
}
