import 'package:get/get.dart';

class CartMetodePembayaranPageController extends GetxController {
  RxList<int> selectedId = <int>[].obs;
  RxBool isSelectedIdEmpty = false.obs;

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

}