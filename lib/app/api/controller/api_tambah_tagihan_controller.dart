import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiTambahTagihanController {
  // static final TagihanTerdaftarPageController tagihanTerdaftarPageController =
  //     Get.put(TagihanTerdaftarPageController());


  static final isLoading = false.obs;
  static final box = GetStorage();

  static Future postTagihanPBB({
    String? noTagihan,
    String? namaTagihan,
    String? tanggalBayar,
    String? bulanBayar,
    String? kotaKabupaten,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'no_tagihan': noTagihan,
        'nama_tagihan': namaTagihan,
        'tanggal_bayar': tanggalBayar,
        'bulan_bayar': bulanBayar,
        'kota_kabupaten': kotaKabupaten,
      };

      var response = await http.post(
        Uri.parse('${url}/tagihan-terdaftar/store-pbb'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
        print("tambah pbb sedang dijalankan");
        // tagihanTerdaftarPageController.selectedTagihan.value = 'PBB';
        Get.offAllNamed('/');
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }
}
