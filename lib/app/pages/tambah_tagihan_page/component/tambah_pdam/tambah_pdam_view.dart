import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_date_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/search_dropdown_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:searchfield/searchfield.dart';

class TambahPdamView extends GetView<TambahTagihanPageController> {
  const TambahPdamView({super.key});

  @override
  Widget build(BuildContext context) {
    final namaTagihanFormKey = GlobalKey<FormState>();
    final noTagihanFormKey = GlobalKey<FormState>();
    
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Daftarkan PDAM",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/icArrowBack.svg")),
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
                formKey: namaTagihanFormKey,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "Nama Tagihan tidak boleh kosong";
                  } else {
                    controller.namaPDAM.value = p0;
                  }
                  return null;
                },
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
              SizedBox(
                height: 10,
              ),
              SearchDropdownWidget(
                hintText: "Kota/Kabupaten",
                onSaved: (value) {
                  controller.kotaKabupatenPDAM.value = value!;
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
                hintText: "Id Pelanggan",
                keyboard: TextInputType.number,
                formKey: noTagihanFormKey,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(12)
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Id Pelanggan tidak boleh kosong";
                  } else {
                    controller.noPelangganPDAM.value = value;
                  }
                  return null;
                },
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "*Nomor Pelanggan berjumlah 11 digit",
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
                      minNumber: 5,
                      onChanged: (value) {
                        controller.tanggalPDAM.value = value!;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonWidget(
        onTap: () {
          if (namaTagihanFormKey.currentState!.validate() &&
              noTagihanFormKey.currentState!.validate()) {
            print("sukses");
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
