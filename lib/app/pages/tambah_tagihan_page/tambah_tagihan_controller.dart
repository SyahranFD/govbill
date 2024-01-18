import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TambahTagihanPageController extends GetxController {
  TextEditingController? ctrNoTagihan;
  TextEditingController? ctrNamaTagihan;
  TextEditingController? ctrTanggalBayar;
  TextEditingController? ctrBulanBayar;
  TextEditingController? ctrKotaKabupaten;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrNoTagihan = TextEditingController();
    ctrNamaTagihan = TextEditingController();
    ctrTanggalBayar = TextEditingController();
    ctrBulanBayar = TextEditingController();
    ctrKotaKabupaten = TextEditingController();
  }
}