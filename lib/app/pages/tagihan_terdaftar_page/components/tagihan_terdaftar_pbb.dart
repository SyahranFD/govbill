import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/api/controller/api_tagihan_terdaftar_controller.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TagihanTerdaftarPBB extends StatelessWidget {
  final ApiTagihanTerdaftarController apiTagihanTerdaftarController =
        Get.put(ApiTagihanTerdaftarController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Obx(
      () => apiTagihanTerdaftarController.isLoading.value
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: apiTagihanTerdaftarController.listTagihanTerdaftarPBB.map((tagihan) {
              var jenisTagihan = tagihan.jenisTagihan!;
              var tanggal = tagihan.tanggalBayar!;
              var bulan = DateFormat.MMMM('id_ID').format(DateTime(2022, tagihan.bulanBayar!));

              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 20, left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("NOP : " + tagihan.noTagihan!, style: tsLabelRegularDarkBlue),
                              SvgPicture.asset(
                                "assets/icons/icMenu.svg",
                                width: 16,
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: categoryPBB,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 10,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                width: width * 0.1,
                                height: width * 0.1,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  "assets/icons/icKategori$jenisTagihan.svg",
                                  width: 24,
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: width * 0.685,
                                      child: Text(tagihan.namaTagihan!, style: tsBodySmallSemiboldBlack)
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                      width: width * 0.685,
                                      child: Text("Terjadwal dibayar setiap tanggal $tanggal bulan $bulan", style: tsLabelRegularBlack)
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}