import 'package:get/get.dart';
import 'package:govbill/app/pages/metode_pembayaran_page/metode_pembayaran_controller.dart';

class MetodePembayaranPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MetodePembayaranPageController>(
          () => MetodePembayaranPageController(),
    );
  }
}