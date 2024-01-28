import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/api/model/history_model.dart';
import 'package:govbill/app/pages/history_page/components/card_history_bpjs.dart';
import 'package:govbill/app/pages/history_page/components/card_history_mobil.dart';
import 'package:govbill/app/pages/history_page/components/card_history_motor.dart';
import 'package:govbill/app/pages/history_page/components/card_history_pbb.dart';
import 'package:govbill/app/pages/history_page/components/card_history_pdam.dart';
import 'package:govbill/app/pages/history_page/components/card_history_pgn.dart';
import 'package:govbill/app/pages/history_page/components/card_history_pln.dart';
import 'package:govbill/app/pages/history_page/history_page_controller.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';

class HistoryPageView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryPageController());
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return RefreshIndicator(
      onRefresh: () => controller.refreshData(),
      child: Scaffold(
        backgroundColor: backgroundPageColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundPageColor,
          toolbarHeight: 75,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("History", style: tsBodyLargeSemiboldBlack),
        ),
        body: Obx(
              () {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
               List<HistoryModel> historyList =
                  controller.listHistory;

              if (historyList.isEmpty) {
                return Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 100,
                  child: Text(
                    "Tidak Ada Riwayat",
                    style: tsBodyMediumRegularDarkGrey,
                  ),
                );
              }
              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15, left: width * 0.05, right: width * 0.05),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ListView.builder(
                    itemCount: controller.listHistory.length,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      HistoryModel tagihan = historyList[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  tagihan.jenisTagihan == "BPJS"
                                      ? CardHistoryBPJS(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: controller.dateFormat(date: tagihan.waktuBayar),
                                      nominalTagihan: controller.currencyFormat(nominal: tagihan.nominalTagihan!))
                                      : tagihan.jenisTagihan == "PDAM"
                                      ? CardHistoryPDAM(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: controller.dateFormat(date: tagihan.waktuBayar),
                                      nominalTagihan:
                                      controller.currencyFormat(nominal: tagihan.nominalTagihan!))
                                      : tagihan.jenisTagihan == "PLN"
                                      ? CardHistoryPLN(
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan:
                                      tagihan.jenisTagihan,
                                      namaTagihan:
                                      tagihan.namaTagihan,
                                      waktuBayar:
                                      controller.dateFormat(date: tagihan.waktuBayar),
                                      nominalTagihan:
                                      controller.currencyFormat(nominal: tagihan.nominalTagihan!))
                                      : tagihan.jenisTagihan == "PBB"
                                      ? CardHistoryPBB(
                                      noTagihan:
                                      tagihan.noTagihan,
                                      jenisTagihan:
                                      tagihan.jenisTagihan,
                                      namaTagihan:
                                      tagihan.namaTagihan,
                                      waktuBayar:
                                      controller.dateFormat(date: tagihan.waktuBayar),
                                      nominalTagihan:
                                      controller.currencyFormat(nominal: tagihan.nominalTagihan!))
                                      : tagihan.jenisTagihan ==
                                      "Mobil"
                                      ? CardHistoryMobil(
                                      noTagihan:
                                      tagihan.noTagihan,
                                      jenisTagihan:
                                      tagihan.jenisTagihan,
                                      namaTagihan:
                                      tagihan.namaTagihan,
                                      waktuBayar:
                                      controller.dateFormat(date: tagihan.waktuBayar),
                                      nominalTagihan:
                                      controller.currencyFormat(nominal: tagihan.nominalTagihan!))
                                      : tagihan.jenisTagihan ==
                                      "Motor"
                                      ? CardHistoryMotor(
                                      noTagihan: tagihan
                                          .noTagihan,
                                      jenisTagihan:
                                      tagihan
                                          .jenisTagihan,
                                      namaTagihan:
                                      tagihan
                                          .namaTagihan,
                                      waktuBayar:
                                      controller.dateFormat(date: tagihan.waktuBayar),
                                      nominalTagihan:
                                      controller.currencyFormat(nominal: tagihan.nominalTagihan!))
                                      : tagihan.jenisTagihan ==
                                      "PGN"
                                      ? CardHistoryPGN(
                                      noTagihan: tagihan
                                          .noTagihan,
                                      jenisTagihan:
                                      tagihan
                                          .jenisTagihan,
                                      namaTagihan:
                                      tagihan
                                          .namaTagihan,
                                      waktuBayar:
                                      controller.dateFormat(date: tagihan.waktuBayar),
                                      nominalTagihan:
                                      controller.currencyFormat(nominal: tagihan.nominalTagihan!))
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
              );
            }
          },
        ),
      ),
    );
  }
}
