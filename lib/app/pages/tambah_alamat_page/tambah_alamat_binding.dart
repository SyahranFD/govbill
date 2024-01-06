import 'package:get/get.dart';
import 'package:govbill/app/pages/tambah_tagihan_binding/tambah_tagihan_controller.dart';

class TambahAlamatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahTagihanPageController>(
          () => TambahTagihanPageController(),
    );
  }
}
