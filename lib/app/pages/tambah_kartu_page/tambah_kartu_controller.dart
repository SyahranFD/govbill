import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahKartuPageController extends GetxController {
  TextEditingController? ctrNomorKartu;
  TextEditingController? ctrBulan;
  TextEditingController? ctrTahun;
  TextEditingController? ctrCvv;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrNomorKartu = TextEditingController();
    ctrBulan = TextEditingController();
    ctrTahun = TextEditingController();
    ctrCvv = TextEditingController();
  }
}