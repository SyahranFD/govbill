import 'package:get/get.dart';
import 'package:govbill/app/pages/pilih_tagihan_page/pilih_tagihan_controller.dart';

class PilihTagihanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihTagihanPageController>(
          () => PilihTagihanPageController(),
    );
  }
}