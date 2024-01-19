import 'package:flutter/material.dart';
import 'package:govbill/app/pages/home_page/widgets/category_rectangle.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';

class HomeCategoryComponent extends StatelessWidget {
  final TagihanTerdaftarPageController controller =
        Get.put(TagihanTerdaftarPageController());

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/tagihan-terdaftar');
                controller.selectedTagihan.value = "Motor";
              },
              child: categoryRectangle(context: context, colorCategory: categoryMotor, jenisTagihan: "Motor")
            ),
            InkWell(
                onTap: () {
                  Get.toNamed('/tagihan-terdaftar');
                  controller.selectedTagihan.value = "Mobil";
                },
                child: categoryRectangle(context: context, colorCategory: categoryMobil, jenisTagihan: "Mobil"),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/tagihan-terdaftar');
                controller.selectedTagihan.value = "PBB";
              },
              child: categoryRectangle(context: context, colorCategory: categoryPBB, jenisTagihan: "PBB"),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/tagihan-terdaftar');
                controller.selectedTagihan.value = "PLN";
              },
              child: categoryRectangle(context: context, colorCategory: categoryPLN, jenisTagihan: "PLN"),
            ),
          ],
        ),

        SizedBox(height: 18),

        Row(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/tagihan-terdaftar');
                controller.selectedTagihan.value = "PGN";
              },
              child: categoryRectangle(context: context, colorCategory: categoryPGN, jenisTagihan: "PGN"),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/tagihan-terdaftar');
                controller.selectedTagihan.value = "BPJS";
              },
              child: categoryRectangle(context: context, colorCategory: categoryBPJS, jenisTagihan: "BPJS"),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/tagihan-terdaftar');
                controller.selectedTagihan.value = "PDAM";
              },
              child: categoryRectangle(context: context, colorCategory: categoryPDAM, jenisTagihan: "PDAM"),
            ),
          ],
        )
      ],
    );
  }
}