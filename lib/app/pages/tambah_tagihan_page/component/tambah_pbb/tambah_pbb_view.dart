import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tambah_tagihan_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_bulan_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_date_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/search_dropdown_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:searchfield/searchfield.dart';

class TambahPbbView extends GetView<TambahTagihanPageController> {
  final ApiTambahTagihanController apiTambahTagihanController =
      Get.put(ApiTambahTagihanController());

  @override
  Widget build(BuildContext context) {
    final namaTagihanFormKey = GlobalKey<FormState>();
    final noTagihanFormKey = GlobalKey<FormState>();
    final kotaKabupatenFormKey = GlobalKey<FormState>();
    final tanggalTagihanFormKey = GlobalKey<FormState>();
    final bulanTagihanFormKey = GlobalKey<FormState>();

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
                formKey: namaTagihanFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Tagihan tidak boleh kosong";
                  } else {
                    controller.namaPBB.value = value;
                  }
                  return null;
                },
                height: 55,
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                // controller: controller.ctrNamaTagihan,
              ),
              SizedBox(
                height: 10,
              ),
              SearchDropdownWidget(
                hintText: "Kota/Kabupaten",
                formKey: kotaKabupatenFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Kota/Kabupaten tidak boleh kosong";
                  } else if (!controller.kabupatenData.contains(value)) {
                    return "Kota/Kabupaten tidak ditemukan";
                  } else {
                    controller.kotaKabupatenPDAM.value = value;
                  }
                  return null;
                },
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                suggestions: controller.kabupatenData
                    .map((e) => SearchFieldListItem(e))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "Nomor Objek Pajak (NOP)",
                formKey: noTagihanFormKey,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nomor Objek Pajak tidak boleh kosong";
                  } else {
                    controller.noNOPPBB.value = value;
                  }
                  return null;
                },
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                // controller: controller.ctrNoTagihan,
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
                          controller.bulanPBB.value = value;
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ]),
          )),
      floatingActionButton: Obx(() => ButtonWidget(
            onTap: () {
              if (namaTagihanFormKey.currentState!.validate() &&
                  kotaKabupatenFormKey.currentState!.validate() &&
                  tanggalTagihanFormKey.currentState!.validate() &&
                  bulanTagihanFormKey.currentState!.validate() &&
                  noTagihanFormKey.currentState!.validate()) {
                controller.postTagihanPBB();
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
