import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/api/model/history_model.dart';
import 'package:govbill/app/pages/history_page/components/card_history_bpjs.dart';
import 'package:intl/intl.dart';

class HistoryPageController extends GetxController {
  final ApiHistoryController apiHistoryController = Get.put(ApiHistoryController());
  var isLoading = false.obs;

  Future<void> refreshData() async {
    fetchHistory();
  }

  String currencyFormat({required int nominal}) {
    var nominalTagihanFormatted = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(nominal).replaceAll(",00", "");
    return nominalTagihanFormatted;
  }

  String dateFormat({DateTime? date}) {
    var paymentDateFormatted =
        date != null ? DateFormat('dd MMMM yyyy', 'id_ID').format(date) : 'N/A';
    return paymentDateFormatted;
  }

  RxList<HistoryModel> listHistory = <HistoryModel>[].obs;
  void fetchHistory() async {
    isLoading.value = true;
    await ApiHistoryController.fetchHistory().then((value) {
      List<dynamic> data = value;
      listHistory.value = data.map((e) => HistoryModel.fromJson(e)).toList();
    });
    isLoading.value = false;
  }
}