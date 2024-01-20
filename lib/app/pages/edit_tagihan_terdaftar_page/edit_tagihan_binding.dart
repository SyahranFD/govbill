import 'package:get/get.dart';
import 'package:govbill/app/pages/edit_tagihan_terdaftar_page/edit_tagihan_controller.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/tagihan_terdaftar_controller.dart';

class EditTagihanTerdaftarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTagihanTerdaftarPageController>(
          () => EditTagihanTerdaftarPageController(),
    );
  }
}