import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tambah_tagihan_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahPbbView extends StatelessWidget {
  final TambahTagihanPageController controller =
      Get.put(TambahTagihanPageController());
  final ApiTambahTagihanController apiTambahTagihanController =
      Get.put(ApiTambahTagihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("Daftarkan PBB", style: tsBodyLargeSemiboldBlack),
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
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 15,
              ),
              TextInputWidget(
                hintText: "Nama Tagihan",
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
                controller: controller.ctrNamaTagihan,
              ),
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "Nama Kota/Kabupaten",
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
                controller: controller.ctrKotaKabupaten,
              ),
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "Nomor Objek Pajak (NOP)",
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
                controller: controller.ctrNoTagihan,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "*NOP berjumlah 18 digit",
                  style: tsLabelRegularRed,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    Text(
                      "Tanggal",
                      style: tsBodySmallSemiboldBlueGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextInputWidget(
                      height: 35,
                      width: 60,
                      hintText: "20",
                      keyboard: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      padding: EdgeInsets.only(top: 10, left: 15),
                      controller: controller.ctrTanggalBayar,
                    ),
                  ],
                ),
              ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Row(
                      children: [
                        Text(
                          "Bulan",
                          style: tsBodySmallSemiboldBlueGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextInputWidget(
                          height: 35,
                          width: 60,
                          hintText: "20",
                          keyboard: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          padding: EdgeInsets.only(top: 10, left: 15),
                          controller: controller.ctrBulanBayar,
                        ),
                      ],
                    ),
                  ),
                  Obx(() => apiTambahTagihanController.isLoading.value
                      ? Center(
                        child: CircularProgressIndicator(),
                  )
                      : Container()),
            ]),
          )),
      floatingActionButton: ButtonWidget(
        onTap: () async {
          await apiTambahTagihanController.postTagihanPBB(
              namaTagihan: controller.ctrNamaTagihan!.text,
              kotaKabupaten: controller.ctrKotaKabupaten!.text,
              noTagihan: controller.ctrNoTagihan!.text,
              tanggalBayar: controller.ctrTanggalBayar!.text,
              bulanBayar: controller.ctrBulanBayar!.text,
          );
        },
        title: "Daftar",
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
