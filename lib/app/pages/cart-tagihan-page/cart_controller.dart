import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';

class CartPageController extends GetxController {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  RxList<int> selectedId = <int>[].obs;
  RxBool isSelectedIdEmpty = false.obs;

  void addAllToSelectedId() {
    apiTagihanAkanDatangController.listTagihanAkanDatang.forEach((element) {
      selectedId.add(element.id!);
    });
  }

  void addToSelectedId(int id) {
    if (!selectedId.contains(id)) {
      selectedId.add(id);
    } else {
      selectedId.remove(id);
    }
  }

  bool isIdSelected(int id) {
    return selectedId.contains(id);
  }

  void checkIsIdEmpty() {
    isSelectedIdEmpty.value = selectedId.isEmpty;
  }

  void clearSelectedId() {
    selectedId.clear();
    apiTagihanAkanDatangController.fetchTagihanAkanDatang();
  }
}