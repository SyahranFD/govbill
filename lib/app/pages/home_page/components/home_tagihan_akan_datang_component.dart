import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_profile_controller.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/pages/home_page/home_page_controller.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_bpjs.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_mobil.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_motor.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pbb.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pdam.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Tagihan Akan Datang", style: tsBodyMediumSemiboldBlack),
            Text("Lihat Selengkapnya", style: tsLabelMediumDarkBlue),
          ],
        ),
        SizedBox(height: 15),
        Obx(
          () => apiTagihanAkanDatangController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                children: apiTagihanAkanDatangController
                    .listTagihanAkanDatang
                    .take(2)
                    .map((tagihan) {
                  var nominalTagihanFormatted = NumberFormat.currency(
                          locale: 'id_ID', symbol: 'Rp ')
                      .format(tagihan.nominalTagihan);
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
                                      jenisTagihan:
                                          tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan:
                                          nominalTagihanFormatted)
                                  : tagihan.jenisTagihan == "PDAM"
                                      ? CardTagihanAkanDatangPDAM(
                                          noTagihan: tagihan.noTagihan,
                                          jenisTagihan:
                                              tagihan.jenisTagihan,
                                          namaTagihan:
                                              tagihan.namaTagihan,
                                          waktuBayar:
                                              paymentDateFormatted,
                                          nominalTagihan:
                                              nominalTagihanFormatted)
                                      : tagihan.jenisTagihan == "PLN"
                                          ? CardTagihanAkanDatangPLN(
                                              noTagihan:
                                                  tagihan.noTagihan,
                                              jenisTagihan:
                                                  tagihan.jenisTagihan,
                                              namaTagihan:
                                                  tagihan.namaTagihan,
                                              waktuBayar:
                                                  paymentDateFormatted,
                                              nominalTagihan:
                                                  nominalTagihanFormatted)
                                          : tagihan.jenisTagihan ==
                                                  "PBB"
                                              ? CardTagihanAkanDatangPBB(
                                                  noTagihan:
                                                      tagihan.noTagihan,
                                                  jenisTagihan: tagihan
                                                      .jenisTagihan,
                                                  namaTagihan: tagihan
                                                      .namaTagihan,
                                                  waktuBayar:
                                                      paymentDateFormatted,
                                                  nominalTagihan:
                                                      nominalTagihanFormatted)
                                              : tagihan.jenisTagihan ==
                                                      "Mobil"
                                                  ? CardTagihanAkanDatangMobil(
                                                      noTagihan: tagihan
                                                          .noTagihan,
                                                      jenisTagihan: tagihan
                                                          .jenisTagihan,
                                                      namaTagihan: tagihan
                                                          .namaTagihan,
                                                      waktuBayar:
                                                          paymentDateFormatted,
                                                      nominalTagihan:
                                                          nominalTagihanFormatted)
                                                  : tagihan.jenisTagihan ==
                                                          "Motor"
                                                      ? CardTagihanAkanDatangMotor(
                                                          noTagihan: tagihan
                                                              .noTagihan,
                                                          jenisTagihan:
                                                              tagihan
                                                                  .jenisTagihan,
                                                          namaTagihan:
                                                              tagihan
                                                                  .namaTagihan,
                                                          waktuBayar:
                                                              paymentDateFormatted,
                                                          nominalTagihan:
                                                              nominalTagihanFormatted)
                                                      : Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
        ),
      ],
    );
  }
}