import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:http/http.dart' as http;

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
        return "success";
      } else {
        return json.decode(response.body)["message"];
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }

  static Future<String?> postTagihanPDAM({
    String? noTagihan,
    String? namaTagihan,
    String? tanggalBayar,
    String? kotaKabupaten,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'no_tagihan': noTagihan,
        'nama_tagihan': namaTagihan,
        'tanggal_bayar': tanggalBayar,
        'kota_kabupaten': kotaKabupaten,
      };

      var response = await http.post(
        Uri.parse('${url}/tagihan-terdaftar/store-pdam'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        return "success";
      } else {
        return json.decode(response.body)["message"];
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future postTagihanPLN({
    String? noTagihan,
    String? namaTagihan,
    String? tanggalBayar,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'no_tagihan': noTagihan,
        'nama_tagihan': namaTagihan,
        'tanggal_bayar': tanggalBayar,
      };

      var response = await http.post(
        Uri.parse('${url}/tagihan-terdaftar/store-pln'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        return "success";
      } else {
        return json.decode(response.body)["message"];
      }
    } catch (e) {

      print(e.toString());
    }
  }

  static Future<String?> postTagihanPGN({
    String? noTagihan,
    String? namaTagihan,
    String? tanggalBayar,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'no_tagihan': noTagihan,
        'nama_tagihan': namaTagihan,
        'tanggal_bayar': tanggalBayar,
      };

      var response = await http.post(
        Uri.parse('${url}/tagihan-terdaftar/store-pgn'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        return "success";
      } else {
        return json.decode(response.body)["message"];
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future postTagihanBPJS({
    String? noTagihan,
    String? namaTagihan,
    String? tanggalBayar,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'no_tagihan': noTagihan,
        'nama_tagihan': namaTagihan,
        'tanggal_bayar': tanggalBayar,
      };

      var response = await http.post(
        Uri.parse('${url}/tagihan-terdaftar/store-bpjs'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        return "success";
      } else {
        return json.decode(response.body)["message"];
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }
}
