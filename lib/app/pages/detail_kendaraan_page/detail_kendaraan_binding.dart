import 'package:get/get.dart';
import 'package:govbill/app/pages/detail_kendaraan_page/detail_kendaraan_controller.dart';

class DetailKendaraanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKendaraanPageController>(
          () => DetailKendaraanPageController(),
    );
  }
}

