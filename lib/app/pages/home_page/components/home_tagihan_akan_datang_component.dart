import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/api/model/tagihan_akan_datang_model.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_bpjs.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_mobil.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_motor.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pbb.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pdam.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pgn.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pln.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';

class HomeTagihanAkanDatangComponent extends StatelessWidget {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Tagihan Tersedia", style: tsBodyMediumSemiboldBlack),
            InkWell(
              onTap: () {
                Get.toNamed("/tagihan-akan-datang");
              },
              child: Text("Selengkapnya", style: tsLabelMediumDarkBlue),
            ),
          ],
        ),
        SizedBox(height: 15),
        Obx(
          () => apiTagihanAkanDatangController.isLoading.value
              ? Container(
                width: double.infinity,
                height: 100,
                child: Center(
                    child: CircularProgressIndicator(),
                  ),
              )
              : apiTagihanAkanDatangController.listTagihanAkanDatang.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 100,
                      child: Text("Tidak Ada Tagihan",
                          style: tsBodyMediumRegularDarkGrey),
                    )
                  : ListView.builder(
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var tagihan = apiTagihanAkanDatangController
                          .listTagihanAkanDatang[index];
                      var nominalTagihanFormatted = NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                      ).format(tagihan.nominalTagihan);
                      nominalTagihanFormatted =
                          nominalTagihanFormatted.replaceAll(",00", "");

                      var paymentDateFormatted = tagihan.waktuBayar != null
                          ? DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(tagihan.waktuBayar!)
                          : 'N/A';

                      return Container(
                        margin: EdgeInsets.only(bottom: 0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  tagihan.jenisTagihan == "BPJS"
                                      ? CardTagihanAkanDatangBPJS(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted)
                                      : tagihan.jenisTagihan == "PDAM"
                                      ? CardTagihanAkanDatangPDAM(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted)
                                      : tagihan.jenisTagihan == "PLN"
                                      ? CardTagihanAkanDatangPLN(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted)
                                      : tagihan.jenisTagihan == "PBB"
                                      ? CardTagihanAkanDatangPBB(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted)
                                      : tagihan.jenisTagihan == "Mobil"
                                      ? CardTagihanAkanDatangMobil(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted)
                                      : tagihan.jenisTagihan == "Motor"
                                      ? CardTagihanAkanDatangMotor(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted)
                                      : tagihan.jenisTagihan == "PGN"
                                      ? CardTagihanAkanDatangPGN(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted)
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }
}
