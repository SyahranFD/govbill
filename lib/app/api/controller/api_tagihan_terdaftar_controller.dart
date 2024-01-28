import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/model/tagihan_terdaftar_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';

class ApiTagihanTerdaftarController extends GetxController {
  RxList<TagihanTerdaftarModel> listTagihanTerdaftar = <TagihanTerdaftarModel>[].obs;
  RxList<TagihanTerdaftarModel> listTagihanTerdaftarMotor = <TagihanTerdaftarModel>[].obs;
  RxList<TagihanTerdaftarModel> listTagihanTerdaftarMobil = <TagihanTerdaftarModel>[].obs;
  RxList<TagihanTerdaftarModel> listTagihanTerdaftarPBB = <TagihanTerdaftarModel>[].obs;
  RxList<TagihanTerdaftarModel> listTagihanTerdaftarPLN = <TagihanTerdaftarModel>[].obs;
  RxList<TagihanTerdaftarModel> listTagihanTerdaftarPGN = <TagihanTerdaftarModel>[].obs;
  RxList<TagihanTerdaftarModel> listTagihanTerdaftarBPJS = <TagihanTerdaftarModel>[].obs;
  RxList<TagihanTerdaftarModel> listTagihanTerdaftarPDAM = <TagihanTerdaftarModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchTagihanTerdaftar();
    initializeDateFormatting();
    super.onInit();
  }

  Future fetchTagihanTerdaftar() async {
    print('fetch tagihan terdaftar dijalankan');
    try {
      listTagihanTerdaftar.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}/tagihan-terdaftar/show-all'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['data'];
        for (var item in content) {
          listTagihanTerdaftar.add(TagihanTerdaftarModel.fromJson(item));
        }
        syncFilterList();
        print('berhasil fetch tagihan terdaftar');
        listTagihanTerdaftar.forEach((tagihan) {
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

  Future deleteTagihanTerdaftar(String id) async {
    try {
      isLoading.value = true;
      var response = await http.delete(Uri.parse('${url}/tagihan-terdaftar/delete/$id'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        print('berhasil hapus tagihan terdaftar');
        fetchTagihanTerdaftar();
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  Future updateTagihanTerdaftar({
    String? id,
    String? namaTagihan,
    String? tanggalBayar,
    String? bulanBayar
  }) async {
    try {
      isLoading.value = true;
      var response = await http.put(Uri.parse('${url}/tagihan-terdaftar/update/$id'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      }, body: {
        'nama_tagihan': namaTagihan,
        'tanggal_bayar': tanggalBayar,
        'bulan_bayar': bulanBayar,
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        print('berhasil update tagihan terdaftar');
        fetchTagihanTerdaftar();
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  void syncFilterList() {
    listTagihanTerdaftarMotor.clear();
    listTagihanTerdaftarMobil.clear();
    listTagihanTerdaftarPBB.clear();
    listTagihanTerdaftarPLN.clear();
    listTagihanTerdaftarPGN.clear();
    listTagihanTerdaftarBPJS.clear();
    listTagihanTerdaftarPDAM.clear();

    listTagihanTerdaftar.forEach((tagihan) {
      if (tagihan.jenisTagihan == 'Motor') {
        listTagihanTerdaftarMotor.add(tagihan);
      }
    });
    listTagihanTerdaftar.forEach((tagihan) {
      if (tagihan.jenisTagihan == 'Mobil') {
        listTagihanTerdaftarMobil.add(tagihan);
      }
    });
    listTagihanTerdaftar.forEach((tagihan) {
      if (tagihan.jenisTagihan == 'PBB') {
        listTagihanTerdaftarPBB.add(tagihan);
      }
    });
    listTagihanTerdaftar.forEach((tagihan) {
      if (tagihan.jenisTagihan == 'PLN') {
        listTagihanTerdaftarPLN.add(tagihan);
      }
    });
    listTagihanTerdaftar.forEach((tagihan) {
      if (tagihan.jenisTagihan == 'PGN') {
        listTagihanTerdaftarPGN.add(tagihan);
      }
    });
    listTagihanTerdaftar.forEach((tagihan) {
      if (tagihan.jenisTagihan == 'BPJS') {
        listTagihanTerdaftarBPJS.add(tagihan);
      }
    });
    listTagihanTerdaftar.forEach((tagihan) {
      if (tagihan.jenisTagihan == 'PDAM') {
        listTagihanTerdaftarPDAM.add(tagihan);
      }
    });
  }
}