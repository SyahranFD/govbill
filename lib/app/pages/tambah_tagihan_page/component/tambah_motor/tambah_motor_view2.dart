import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_bulan_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_date_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahMotorKonfirmasiView extends GetView<TambahTagihanPageController> {
  const TambahMotorKonfirmasiView({super.key});

  @override
  Widget build(BuildContext context) {
    final tanggalTagihanFormKey = GlobalKey<FormState>();
    final bulanTagihanFormKey = GlobalKey<FormState>();
    final namaTagihanFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Daftarkan Motor",
          style: tsBodyLargeSemiboldBlack,
        ),
        backgroundColor: backgroundPageColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset("assets/icons/icArrowBack.svg"),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "Masukkan Nama Tagihan",
                formKey: namaTagihanFormKey,
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                validator: (value) {
                  if (value == null) {
                    return "Nama Tagihan Tidak Boleh Kosong";
                  } else {
                    controller.namaTagihanMotor.value = value;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Jadwalkan pembayaran untuk tagihan anda",
                style: tsBodySmallRegularBlueGrey,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "Tanggal",
                        style: tsBodySmallSemiboldBlueGrey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownDateWidget(
                      hintText: "02",
                      maxNumber: 16,
                      minNumber: 5,
                      formKey: tanggalTagihanFormKey,
                      validator: (value) {
                        if (value == null) {
                          return "";
                        } else {
                          controller.tanggalDaftarMotor.value = value;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "Bulan",
                        style: tsBodySmallSemiboldBlueGrey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownBulanWidget(
                      formKey: bulanTagihanFormKey,
                      items: controller.bulanDropdownPbb,
                      validator: (value) {
                        if (value == null) {
                          return "";
                        } else {
                          controller.bulanDaftarMotor.value = value;
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Masukkan alamat untuk mengirim TBPKP",
                style: tsBodySmallRegularBlueGrey,
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() =>
                  controller.selectedAlamat.value ??
                  Center(
                    child: Text(
                      "Terjadi Kesalahan",
                      style: tsLabelMediumBlueGrey,
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() => ButtonWidget(
            onTap: () {
              if (namaTagihanFormKey.currentState!.validate() &&
                  tanggalTagihanFormKey.currentState!.validate() &&
                  bulanTagihanFormKey.currentState!.validate()) {
                controller.postTagihanMotor();
              }
            },
            isLoading: controller.isLoading.value,
            title: "Simpan",
            height: 55,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
