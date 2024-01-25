import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/model/metode_pembayaran_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';

class ApiMetodePembayaranController extends GetxController {
  RxList<MetodePembayaranModel> listMetodePembayaran = <MetodePembayaranModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchMetodePembayaran();
    initializeDateFormatting();
    super.onInit();
  }

  Future fetchMetodePembayaran() async {
    print('fetch metode pembayaran dijalankan');
    try {
      listMetodePembayaran.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}/metode-pembayaran/show-all'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['data'];
        for (var item in content) {
          listMetodePembayaran.add(MetodePembayaranModel.fromJson(item));
        }
        print('berhasil fetch metode pembayaran');
        listMetodePembayaran.forEach((tagihan) {
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

  Future changePembayaranUtama(String id) async {
    try {
      isLoading.value = true;
      var response = await http.put(
        Uri.parse('${url}/metode-pembayaran/change-pembayaran-utama/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        fetchMetodePembayaran();
        print('berhasil change pembayaran utama');
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  Future deleteMetodePembayaran(String id) async {
    try {
      isLoading.value = true;
      var response = await http.delete(Uri.parse('${url}/metode-pembayaran/delete/$id'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        print('berhasil hapus metode pembayaran');
        fetchMetodePembayaran();
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