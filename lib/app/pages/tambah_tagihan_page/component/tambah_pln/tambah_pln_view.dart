import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_date_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahPlnView extends GetView<TambahTagihanPageController> {
  TambahPlnView({super.key});

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
        title: Text("Daftarkan PLN", style: tsBodyLargeSemiboldBlack),
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
        height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            TextInputWidget(
              hintText: "Nama Tagihan",
              keyboard: TextInputType.name,
              formKey: namaTagihanFormKey,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nama Tagihan tidak boleh kosong";
                } else {
                  controller.namaPLN.value = value;
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextInputWidget(
              hintText: "ID Pelanggan",
              keyboard: TextInputType.number,
              formKey: noTagihanFormKey,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12)
              ],
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              validator: (value) {
                if (value!.isEmpty) {
                  return "ID Pelanggan tidak boleh kosong";
                } else {
                  controller.idPelangganPLN.value = value;
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
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
                        controller.tanggalPDAM.value = value;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: Obx(() => ButtonWidget(
            onTap: () {
              if (namaTagihanFormKey.currentState!.validate() &&
                  tanggalTagihanFormKey.currentState!.validate() &&
                  noTagihanFormKey.currentState!.validate()) {
                controller.postTagihanPLN();
              }
              ;
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
