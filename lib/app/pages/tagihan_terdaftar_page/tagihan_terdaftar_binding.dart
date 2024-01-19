import 'package:get/get.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/tagihan_terdaftar_controller.dart';

class TagihanTerdaftarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagihanTerdaftarPageController>(
          () => TagihanTerdaftarPageController(),
    );
  }
}