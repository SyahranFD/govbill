import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_terdaftar_controller.dart';

class TagihanTerdaftarPageController extends GetxController {
  final ApiTagihanTerdaftarController apiTagihanTerdaftarController =
      Get.put(ApiTagihanTerdaftarController());

  RxString selectedTagihan = "".obs;
  RxString selectedIdTagihan = "".obs;

  TextEditingController? ctrNamaTagihan;
  TextEditingController? ctrTanggalBayar;
  TextEditingController? ctrBulanBayar;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrNamaTagihan = TextEditingController();
    ctrTanggalBayar = TextEditingController();
    ctrBulanBayar = TextEditingController();
  }

  void updateControllerValuesWithBulanBayar(int index) {
    var tagihan = apiTagihanTerdaftarController.listTagihanTerdaftarPBB[index];
    selectedIdTagihan.value = tagihan.id.toString();
    ctrNamaTagihan!.text = tagihan.namaTagihan!;
    ctrTanggalBayar!.text = tagihan.tanggalBayar.toString();
    ctrBulanBayar!.text = tagihan.bulanBayar.toString();
  }

  void updateControllerValues(int index) {
    var tagihan = apiTagihanTerdaftarController.listTagihanTerdaftarPBB[index];
    ctrNamaTagihan!.text = tagihan.namaTagihan!;
    ctrTanggalBayar!.text = tagihan.tanggalBayar.toString();
  }
}