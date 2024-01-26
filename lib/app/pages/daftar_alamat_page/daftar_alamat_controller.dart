import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/model/alamat_model.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:govbill/common/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class DaftarAlamatPageController extends GetxController {
  Future<List<AlamatData>> fetchAlamat() async {
    final box = GetStorage();
    print(box.read("token"));
      var response = await http.get(
        Uri.parse("${url}/alamat/show-all"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> jsonData = jsonResponse["data"];
        List<AlamatData> alamat = jsonData.map((e) => AlamatData.fromJson(e)).toList();
        return alamat;
      } else {
        final data = json.decode(response.body)["message"];
        print(data);
        if (data == "Unauthenticated.") {
          Get.snackbar(
            "Sesi Login Telah Berakhir",
            "Silahkan Login Kembali",
            backgroundColor: warningColor,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
          );
          Get.offAllNamed(Routes.LOGIN_PAGE);
        } else {
          Get.snackbar(
            "Error",
            data,
            backgroundColor: warningColor,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
          );
          throw Exception('Failed to load Alamat');
        }
        throw Exception('Failed to load Alamat');
      }
  }
}
