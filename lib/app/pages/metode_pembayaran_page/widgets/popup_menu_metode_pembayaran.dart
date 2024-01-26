import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_metode_pembayaran_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';

Widget popupMenuMetodePembayaran ({required context, required id, required index}) {
  final MetodePembayaranPageController metodePembayaranPageController =
      Get.put(MetodePembayaranPageController());
  final ApiMetodePembayaranController apiMetodePembayaranController =
      Get.put(ApiMetodePembayaranController());

  var data = apiMetodePembayaranController.listMetodePembayaran[index];

  return PopupMenuButton(
    onSelected: (value) {
      metodePembayaranPageController.selectedMenu.value = value;
      if (value == 1) {
        apiMetodePembayaranController.changePembayaranUtama(id);
      } else if (value == 2) {
        apiMetodePembayaranController.deleteMetodePembayaran(id);
      }
    },
    itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          child: Row(
            children: [
              Text("Jadikan Pembayaran Utama", style: tsBodySmallMediumDarkBlue),
            ],
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Text("Hapus Metode Pembayaran", style: tsBodySmallMediumRed),
            ],
          ),
          value: 2,
        ),
      ];
    },
  );
}