import 'package:get/get.dart';
import 'package:govbill/app/pages/tagihan_tersedia_page/tagihan_tersedia_controller.dart';

class TagihanTersediaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagihanTersediaPageController>(
          () => TagihanTersediaPageController(),
    );
  }
}
