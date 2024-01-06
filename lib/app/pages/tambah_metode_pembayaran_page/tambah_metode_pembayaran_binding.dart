import 'package:get/get.dart';
import 'package:govbill/app/pages/tambah_metode_pembayaran_page/tambah_metode_pembayaran_controller.dart';

class TambahMetodePembayaranPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahMetodePembayaranPageController>(
          () => TambahMetodePembayaranPageController(),
    );
  }
}