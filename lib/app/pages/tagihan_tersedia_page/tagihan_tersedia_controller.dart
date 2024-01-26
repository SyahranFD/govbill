import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class TagihanTersediaPageController extends GetxController {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  Future<void> refreshData() async {
    await apiTagihanAkanDatangController.fetchTagihanAkanDatang();
  }
}
