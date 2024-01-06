import 'package:get/get.dart';
import 'package:govbill/app/pages/daftar_alamat_page/daftar_alamat_controller.dart';

class DaftarAlamatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarAlamatPageController>(
          () => DaftarAlamatPageController(),
    );
  }
}