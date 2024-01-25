import 'package:get/get.dart';
import 'package:govbill/app/pages/cart-tagihan-page/cart_controller.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartPageController>(
          () => CartPageController(),
    );
  }
}
