import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/components/tagihan_terdaftar_pbb.dart';
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

    String jenisTagihan = tagihanTerdaftarPageController.selectedTagihan.value;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("$jenisTagihan Terdaftar", style: tsBodyLargeSemiboldBlack),
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
    );
  }
}
