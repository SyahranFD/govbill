import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostMetodePembayaranController extends GetxController {
  final isLoading = false.obs;

  final box = GetStorage();

  Future tambahKartu({
    required String noKartu,
    required String bulanBerlaku,
    required String tahunBerlaku,
    required String cvv,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'no_kartu': noKartu,
        'bulan_berlaku': bulanBerlaku,
        'tahun_berlaku': tahunBerlaku,
        'cvv' : cvv,
      };

      var response = await http.post(
        Uri.parse('${url}/metode-pembayaran/store-kartu'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        Get.offAllNamed('/tambah-metode-pembayaran');
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
