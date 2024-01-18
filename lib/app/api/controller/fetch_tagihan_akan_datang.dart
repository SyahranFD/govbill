import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/model/tagihan_akan_datang_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';

class FetchTagihanAkanDatangController extends GetxController {
  Rx<List<TagihanAkanDatangModel>> tagihanAkanDatang = Rx<List<TagihanAkanDatangModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchTagihanAkanDatang();
    initializeDateFormatting();
    super.onInit();
  }

  Future fetchTagihanAkanDatang() async {
    print('fetch tagihan akan datang dijalankan');
    try {
      tagihanAkanDatang.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}/tagihan-tersedia/show-all'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['data'];
        for (var item in content) {
          tagihanAkanDatang.value.add(TagihanAkanDatangModel.fromJson(item));
        }
        print('berhasil fetch tagihan akan datang');
        tagihanAkanDatang.value.forEach((tagihan) {
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