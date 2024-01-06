import 'package:get/get.dart';
import 'package:govbill/app/pages/register_page/register_page_controller.dart';


class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPageController>(
          () => RegisterPageController(),
    );
  }
}
