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

  RxBool isWithBulan = false.obs;

  RxInt selectedMenu = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrNamaTagihan = TextEditingController();
    ctrTanggalBayar = TextEditingController();
    ctrBulanBayar = TextEditingController();
  }

  void updateTextEditingController({required int index, required list}) {
    var tagihan = list[index];
    selectedIdTagihan.value = tagihan.id.toString();
    ctrNamaTagihan!.text = tagihan.namaTagihan!;
    ctrTanggalBayar!.text = tagihan.tanggalBayar.toString();
    isWithBulan.value = false;
  }

  void updateTextEditingControllerWithBulan({required int index, required list}) {
    var tagihan = list[index];
    selectedIdTagihan.value = tagihan.id.toString();
    ctrNamaTagihan!.text = tagihan.namaTagihan!;
    ctrTanggalBayar!.text = tagihan.tanggalBayar.toString();
    ctrBulanBayar!.text = tagihan.bulanBayar.toString();
    isWithBulan.value = true;
  }

  Future<void> refreshData() async {
    await apiTagihanTerdaftarController.fetchTagihanTerdaftar();
  }
}