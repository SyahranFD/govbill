import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';

class TagihanAkanDatangPageController extends GetxController {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  Future<void> refreshData() async {
    await apiTagihanAkanDatangController.fetchTagihanAkanDatang();
  }
}