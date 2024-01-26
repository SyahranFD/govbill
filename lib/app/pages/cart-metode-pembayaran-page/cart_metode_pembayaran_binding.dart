import 'package:get/get.dart';
import 'package:govbill/app/pages/cart-metode-pembayaran-page/cart_metode_pembayaran_controller.dart';

class CartMetodePembayaranPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartMetodePembayaranPageController>(
          () => CartMetodePembayaranPageController(),
    );
  }
}
