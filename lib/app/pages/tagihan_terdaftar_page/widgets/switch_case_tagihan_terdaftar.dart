
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_terdaftar_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_bpjs.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_mobil.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_motor.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_pbb.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_pdam.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_pgn.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_pln.dart';

final TagihanTerdaftarPageController tagihanTerdaftarPageController =
    Get.put(TagihanTerdaftarPageController());
final ApiTagihanTerdaftarController apiTagihanTerdaftarController =
    Get.put(ApiTagihanTerdaftarController());

Widget switchCaseTagihanTerdaftar({required context}) {
  switch (tagihanTerdaftarPageController.selectedTagihan.value) {
    case "PBB":
      return TagihanTerdaftarPBB();
    case "Motor":
      return TagihanTerdaftarMotor();
    case "Mobil":
      return TagihanTerdaftarMobil();
    case "PLN":
      return TagihanTerdaftarPLN();
    case "PGN":
      return TagihanTerdaftarPGN();
    case "BPJS":
      return TagihanTerdaftarBPJS();
    case "PDAM":
      return TagihanTerdaftarPDAM();
    default:
      throw UnimplementedError("Unhandled category value: " + tagihanTerdaftarPageController.selectedTagihan.value.toString());
  }
}