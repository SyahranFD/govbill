import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenPageController extends GetxController {
  @override
  void onInit() {
    final box = GetStorage();
    super.onInit();
    if (box.read('token') != null) {
      Future.delayed(
        Duration(seconds: 10),
        () => Get.offNamed('/'),
      );
    } else {
      Future.delayed(
        Duration(seconds: 10),
        () => Get.offNamed('/login'),
      );
    }
  }
}
