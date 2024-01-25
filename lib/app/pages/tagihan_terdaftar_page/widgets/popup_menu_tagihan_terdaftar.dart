import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_terdaftar_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';

Widget popupMenuTagihanTerdaftar ({required index, required list, required idTagihan}) {
  final TagihanTerdaftarPageController tagihanTerdaftarPageController =
      Get.put(TagihanTerdaftarPageController());
  final ApiTagihanTerdaftarController apiTagihanTerdaftarController =
      Get.put(ApiTagihanTerdaftarController());

  return PopupMenuButton(
    onSelected: (value) {
      tagihanTerdaftarPageController.selectedMenu.value = value;
      if (value == 1) {
        tagihanTerdaftarPageController.updateTextEditingController(index: index, list: list);
        print(tagihanTerdaftarPageController.ctrBulanBayar!.text);
        Get.toNamed('/edit-tagihan-terdaftar');
      } else if (value == 2) {
        apiTagihanTerdaftarController.deleteTagihanTerdaftar(idTagihan);
        apiTagihanTerdaftarController.fetchTagihanTerdaftar();
      }
    },
    itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          child: Row(
            children: [
              Text("Edit Tagihan", style: tsBodySmallMediumDarkBlue),
            ],
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Text("Hapus Tagihan", style: tsBodySmallMediumRed),
            ],
          ),
          value: 2,
        ),
      ];
    },
  );
}