import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/model/tagihan_akan_datang_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ApiTagihanAkanDatangController extends GetxController {
  RxList<TagihanAkanDatangModel> listTagihanAkanDatang = <TagihanAkanDatangModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();
  RxString totalNominal = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchTagihanAkanDatang();
    postTagihanAkanDatang();
    initializeDateFormatting();
    super.onInit();
  }

  Future fetchTagihanAkanDatang() async {
    print('fetch tagihan akan datang dijalankan');
    try {
      listTagihanAkanDatang.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}/tagihan-tersedia/show-all'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['data'];
        for (var item in content) {
          listTagihanAkanDatang.add(TagihanAkanDatangModel.fromJson(item));
        }
        calculateTotalNominalTagihan();
        print('berhasil fetch tagihan akan datang');
        listTagihanAkanDatang.forEach((tagihan) {
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

  Future postTagihanAkanDatang() async {
    print('post tagihan akan datang dijalankan');
    try {
      isLoading.value = true;
      var response = await http.post(Uri.parse('${url}/tagihan-tersedia/store'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        print('berhasil post tagihan akan datang');
        Get.offNamed('/');
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  void calculateTotalNominalTagihan() {
    int total = 0;
    listTagihanAkanDatang.forEach((tagihan) {
      total += tagihan.nominalTagihan!;
    });

    var totalNominalFormatted =
    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(total);
    totalNominalFormatted = totalNominalFormatted.replaceAll(",00", "");

    totalNominal.value = totalNominalFormatted;

    print('Total Nominal Tagihan: $total');
  }
}