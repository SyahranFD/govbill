import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/tagihan_terdaftar_controller.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/widgets/switch_case_tagihan_terdaftar.dart';
import 'package:govbill/common/helper/themes.dart';

class TagihanTerdaftarPageView extends StatelessWidget {
  final TagihanTerdaftarPageController tagihanTerdaftarPageController = Get.put(TagihanTerdaftarPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text(tagihanTerdaftarPageController.selectedTagihan.value + " Terdaftar", style: tsBodyLargeSemiboldBlack),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: blackColor,
          ),
        ),
      ),
      body: switchCaseTagihanTerdaftar(context: context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/tambah-' + tagihanTerdaftarPageController.selectedTagihan.value.toLowerCase()),
        child: Icon(Icons.add, color: primaryColor,),
        backgroundColor: secondaryColor,
      )
    );
  }
}
