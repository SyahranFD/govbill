import 'package:get/get.dart';
import 'package:govbill/app/pages/berhasil_terdaftar_page/berhasil_terdaftar_controller.dart';
import 'package:govbill/app/pages/index.dart';

class BerhasilTerdaftarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BerhasilTerdaftarPageController>(
          () => BerhasilTerdaftarPageController(),
    );
  }
}
