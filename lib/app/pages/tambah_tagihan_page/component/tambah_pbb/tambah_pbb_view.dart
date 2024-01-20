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
                onSaved: (value) {
                  controller.kotaKabupatenPBB.value = value!;
                },
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "Kota/Kabupaten tidak boleh kosong";
                  } else {
                    print(p0);
                    controller.kotaKabupatenPBB.value = p0;
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
                  children: [
                    Text(
                      "Tanggal",
                      style: tsBodySmallSemiboldBlueGrey,
                    ),
                    SizedBox(  
                      width: 10,
                    ),
                    DropdownDateWidget(
                      hintText: "02",
                      maxNumber: 20,
                      minNumber: 1,
                      onChanged: (value) {
                        controller.tanggalPBB.value = value!;
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Bulan",
                      style: tsBodySmallSemiboldBlueGrey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownBulanWidget(
                      items: [
                        "Maret",
                        "April",
                        "Mei",
                        "Juni",
                        "Juli",
                        "Agustus",
                        "September",
                      ],
                      onChanged: (value) {
                        controller.bulanPBB.value = value!;
          
                      },
                    )
                  ],
                ),
              ),
                  
                  Obx(() => controller.isLoading.value
                      ? Center(
                        child: CircularProgressIndicator(),
                  )
                      : Container()),
            ]),
          )),
      floatingActionButton: ButtonWidget(
        onTap: () async {
          if (namaTagihanFormKey.currentState!.validate() &&
              noTagihanFormKey.currentState!.validate()) {

          }

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
