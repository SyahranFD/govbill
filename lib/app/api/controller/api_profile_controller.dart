import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/model/profile_model.dart';
import 'package:govbill/app/api/model/tagihan_akan_datang_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ApiProfileController extends GetxController {
  RxList<ProfileModel> listProfile = <ProfileModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProfile();
    super.onInit();
  }

  Future fetchProfile() async {
    print('fetch profile dijalankan');
    try {
      listProfile.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}/users/show'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['user'];
        listProfile.add(ProfileModel.fromJson(content));
        print('berhasil fetch profile');
        print(listProfile[0].toJson());
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