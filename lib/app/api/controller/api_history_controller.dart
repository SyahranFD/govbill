import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/model/history_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';

class ApiHistoryController extends GetxController {
  RxList<HistoryModel> listHistory = <HistoryModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchHistory();
    initializeDateFormatting();
    super.onInit();
  }

  Future fetchHistory() async {
    print('fetch history dijalankan');
    try {
      listHistory.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}/history-tagihan/show-all'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['data'];
        for (var item in content) {
          listHistory.add(HistoryModel.fromJson(item));
        }
        print('berhasil fetch history');
        listHistory.forEach((tagihan) {
          print(tagihan.toJson()); // Assuming toJson() provides a meaningful representation
        });
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

}