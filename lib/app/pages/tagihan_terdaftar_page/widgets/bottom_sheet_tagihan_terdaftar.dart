import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_terdaftar_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';

Widget bottomSheetTagihanTerdaftar ({required BuildContext context, required int index, required String idTagihan, required list}) {
  final ApiTagihanTerdaftarController apiTagihanTerdaftarController =
  Get.put(ApiTagihanTerdaftarController());
  final TagihanTerdaftarPageController tagihanTerdaftarPageController =
  Get.put(TagihanTerdaftarPageController());

  return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.edit_outlined, color: secondaryColor),
                      title: Text("Edit Tagihan", style: tsBodySmallMediumDarkBlue),
                      onTap: () {
                        Get.back() ;
                        tagihanTerdaftarPageController.updateTextEditingController(index: index, list: list);
                        Get.toNamed('/edit-tagihan-terdaftar');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.delete_outline,
                        color: warningColor,
                      ),
                      title: Text("Hapus Tagihan", style: tsBodySmallMediumRed),
                      onTap: () {
                        apiTagihanTerdaftarController.deleteTagihanTerdaftar(idTagihan);
                        Get.back();
                      },
                    ),
                  ],
                ),
              );
            }
        );
      },
      icon: Icon(Icons.more_vert, color: secondaryColor, size: 24,));
}