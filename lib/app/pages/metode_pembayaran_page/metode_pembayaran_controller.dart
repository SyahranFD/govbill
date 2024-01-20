import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_metode_pembayaran_controller.dart';

class MetodePembayaranPageController extends GetxController {
  final ApiMetodePembayaranController apiMetodePembayaranController
        = Get.put(ApiMetodePembayaranController());

  String formatCardNumber(String cardNumber) {
    return '****${cardNumber.substring(cardNumber.length - 4)}';
  }


}