import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_date_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahBpjsView extends GetView<TambahTagihanPageController> {
  const TambahBpjsView({super.key});

  @override
  Widget build(BuildContext context) {
    final namaTagihanFormKey = GlobalKey<FormState>();
    final noTagihanFormKey = GlobalKey<FormState>();
    final tanggalTagihanFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("Daftarkan BPJS", style: tsBodyLargeSemiboldBlack),
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
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              TextInputWidget(
                hintText: "Nama Tagihan",
                keyboard: TextInputType.name,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                formKey: namaTagihanFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Tagihan tidak boleh kosong";
                  } else {
                    controller.namaBPJS.value = value;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "Nomor Virtual Account",
                keyboard: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11)
                ],
                formKey: noTagihanFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nomor Virtual Account tidak boleh kosong";
                  } else {
                    controller.noVABPJS.value = value;
                  }
                  return null;
                },
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "*00000 ditambah 11 digit terakhir nomor Kartu BPJS",
                  style: tsLabelRegularRed,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  "Jadwalkan pembayaran untuk tagihan anda",
                  style: tsBodySmallRegularBlueGrey,
                ),
              ),
              SizedBox(
                height: 5,
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
                            controller.tanggalBPJS.value = value;
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() => ButtonWidget(
            onTap: () {
              if (namaTagihanFormKey.currentState!.validate() &&
                  tanggalTagihanFormKey.currentState!.validate() &&
                  noTagihanFormKey.currentState!.validate()) {
                controller.postTagihanBPJS();
              }
            },
            isLoading: controller.isLoading.value,
            title: "Daftar",
            height: 55,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
