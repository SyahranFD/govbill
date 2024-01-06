import 'package:get/get.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/tagihan_akan_datang_controller.dart';

class PageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagihanAkanDatangPageController>(
          () => TagihanAkanDatangPageController(),
    );
  }
}
