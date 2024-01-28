import 'package:get/get.dart';
import 'package:govbill/app/pages/rincian_pembayaran_page/rincian_pembayaran_controller.dart';

class RincianPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RincianPembayaranController>(
          () => RincianPembayaranController(),
    );
  }
}
