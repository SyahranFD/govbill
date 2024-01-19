import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/pages/history_page/components/card_history_bpjs.dart';
import 'package:govbill/app/pages/history_page/components/card_history_mobil.dart';
import 'package:govbill/app/pages/history_page/components/card_history_motor.dart';
import 'package:govbill/app/pages/history_page/components/card_history_pbb.dart';
import 'package:govbill/app/pages/history_page/components/card_history_pdam.dart';
import 'package:govbill/app/pages/history_page/components/card_history_pln.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';

class HistoryPageView extends StatelessWidget {
  final ApiHistoryController apiHistoryController =
      Get.put(ApiHistoryController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("History", style: tsBodyLargeSemiboldBlack),
      ),
      body: Obx(
        () => apiHistoryController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    top: 15, left: width * 0.05, right: width * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: apiHistoryController.listHistory.map((tagihan) {
                      var nominalTagihanFormatted =
                          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
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
                            InkWell(
                              onTap: () {
                                print(tagihan.id);
                              },
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    tagihan.jenisTagihan == "BPJS"
                                        ? CardHistoryBPJS(
                                            noTagihan: tagihan.noTagihan,
                                            jenisTagihan: tagihan.jenisTagihan,
                                            namaTagihan: tagihan.namaTagihan,
                                            waktuBayar: paymentDateFormatted,
                                            nominalTagihan: nominalTagihanFormatted)
                                        : tagihan.jenisTagihan == "PDAM"
                                            ? CardHistoryPDAM(
                                                noTagihan: tagihan.noTagihan,
                                                jenisTagihan: tagihan.jenisTagihan,
                                                namaTagihan: tagihan.namaTagihan,
                                                waktuBayar: paymentDateFormatted,
                                                nominalTagihan: nominalTagihanFormatted)
                                            : tagihan.jenisTagihan == "PLN"
                                                ? CardHistoryPLN(
                                                    noTagihan: tagihan.noTagihan,
                                                    jenisTagihan: tagihan.jenisTagihan,
                                                    namaTagihan: tagihan.namaTagihan,
                                                    waktuBayar: paymentDateFormatted,
                                                    nominalTagihan: nominalTagihanFormatted)
                                                : tagihan.jenisTagihan == "PBB"
                                                    ? CardHistoryPBB(
                                                        noTagihan: tagihan.noTagihan,
                                                        jenisTagihan: tagihan.jenisTagihan,
                                                        namaTagihan: tagihan.namaTagihan,
                                                        waktuBayar: paymentDateFormatted,
                                                        nominalTagihan: nominalTagihanFormatted)
                                                    : tagihan.jenisTagihan == "Mobil"
                                                        ? CardHistoryMobil(
                                                            noTagihan: tagihan.noTagihan,
                                                            jenisTagihan: tagihan.jenisTagihan,
                                                            namaTagihan: tagihan.namaTagihan,
                                                            waktuBayar: paymentDateFormatted,
                                                            nominalTagihan: nominalTagihanFormatted)
                                                        : tagihan.jenisTagihan == "Motor"
                                                            ? CardHistoryMotor(
                                                                noTagihan: tagihan.noTagihan,
                                                                jenisTagihan: tagihan.jenisTagihan,
                                                                namaTagihan: tagihan.namaTagihan,
                                                                waktuBayar: paymentDateFormatted,
                                                                nominalTagihan: nominalTagihanFormatted)
                                                            : Container(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
      ),
    );
  }
}
