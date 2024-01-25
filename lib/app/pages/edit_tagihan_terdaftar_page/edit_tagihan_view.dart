import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/edit_tagihan_terdaftar_page/edit_tagihan_controller.dart';
import 'package:govbill/app/pages/edit_tagihan_terdaftar_page/edit_tagihan_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/widgets/switch_case_tagihan_terdaftar.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class EditTagihanTerdaftarPageView extends StatelessWidget {
  final TagihanTerdaftarPageController tagihanTerdaftarPageController =
      Get.put(TagihanTerdaftarPageController());

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
        title: Text("Edit Tagihan", style: tsBodyLargeSemiboldBlack),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text("Nama Tagihan", style: tsLabelRegularDarkGrey),
              SizedBox(height: 3),
              TextInputWidget(
                hintText: "Nama Tagihan",
                height: 40,
                padding: EdgeInsets.only(top: 15, left: 15),
                controller: tagihanTerdaftarPageController.ctrNamaTagihan,
              ),
              SizedBox(height: 10),
              Text("Tanggal Bayar", style: tsLabelRegularDarkGrey),
              SizedBox(height: 3),
              TextInputWidget(
                hintText: "Tanggal Bayar",
                height: 40,
                padding: EdgeInsets.only(top: 15, left: 15),
                controller: tagihanTerdaftarPageController.ctrTanggalBayar,
              ),
              SizedBox(height: 10),
              tagihanTerdaftarPageController.ctrBulanBayar?.text != "0"
                  ? Column(
                    children: [
                      Text("Bulan Bayar", style: tsLabelRegularDarkGrey),
                      SizedBox(height: 3),
                      TextInputWidget(
                        hintText: "Bulan Bayar",
                        height: 40,
                        padding: EdgeInsets.only(top: 15, left: 15),
                        controller: tagihanTerdaftarPageController.ctrBulanBayar,
                      )
                    ],
                  )
                  : Container(),
            ]
          ),
        ),
      ),
      floatingActionButton: ButtonWidget(
        onTap: () async {
          await apiTagihanTerdaftarController.updateTagihanTerdaftar(
              id: tagihanTerdaftarPageController.selectedIdTagihan.value,
              namaTagihan: tagihanTerdaftarPageController.ctrNamaTagihan!.text,
              tanggalBayar: tagihanTerdaftarPageController.ctrTanggalBayar!.text,
              bulanBayar: tagihanTerdaftarPageController.ctrBulanBayar!.text);
          Get.offNamed('/tagihan-terdaftar');
        },
        title: "Simpan",
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
