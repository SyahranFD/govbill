import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_metode_pembayaran_controller.dart';

class CartMetodePembayaranPageController extends GetxController {
  final ApiMetodePembayaranController apiMetodePembayaranController =
      Get.put(ApiMetodePembayaranController());

  RxList<int> selectedId = <int>[].obs;

  void addToSelectedId(int id) {
    selectedId.clear();
    if (!selectedId.contains(id)) {
      selectedId.add(id);
    } else {
      selectedId.remove(id);
    }
  }

  bool isIdSelected(int id) {
    return selectedId.contains(id);
  }

  void addDefaultToSelectedId() {
    selectedId.clear();
    apiMetodePembayaranController.listMetodePembayaran.forEach((element) {
      if(element.pembayaranUtama == 1) {
        selectedId.add(element.id!);
      }
    });
  }
}