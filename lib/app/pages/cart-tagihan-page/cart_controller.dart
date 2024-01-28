import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/api/model/tagihan_akan_datang_model.dart';
import 'package:intl/intl.dart';

class CartPageController extends GetxController {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  RxList<int> selectedId = <int>[].obs;
  RxList<TagihanAkanDatangModel> selectedTagihan = <TagihanAkanDatangModel>[].obs;
  RxString totalSelectedNominal = "".obs;

  void addAllToSelected() {
    selectedId.clear();
    selectedTagihan.clear();
    apiTagihanAkanDatangController.listTagihanAkanDatang.forEach((element) {
      selectedId.add(element.id!);
      selectedTagihan.add(element);
    });
  }

  void addToSelectedId(int id) {
    if (!selectedId.contains(id)) {
      selectedId.add(id);
    } else {
      selectedId.remove(id);
    }
  }

  void addToSelectedTagihan(TagihanAkanDatangModel tagihan) {
    if (!selectedTagihan.contains(tagihan)) {
      selectedTagihan.add(tagihan);
    } else {
      selectedTagihan.remove(tagihan);
    }
  }

  bool isIdSelected(int id) {
    return selectedId.contains(id);
  }

  void calculateTotalSelectedNominal() {
    int total = 0;

    for (int id in selectedId) {
      var selectedTagihan = apiTagihanAkanDatangController.listTagihanAkanDatang
          .firstWhere((tagihan) => tagihan.id == id);

      total += selectedTagihan.nominalTagihan ?? 0;
    }

    var totalFormatted =
    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(total);
    totalFormatted = totalFormatted.replaceAll(",00", "");

    totalSelectedNominal.value = totalFormatted;
  }
}