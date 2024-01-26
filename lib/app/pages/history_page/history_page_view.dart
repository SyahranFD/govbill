import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/api/model/history_model.dart';
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
        automaticallyImplyLeading: false,
        title: Text("History", style: tsBodyLargeSemiboldBlack),
      ),
      body: Obx(
            () {
          if (apiHistoryController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<HistoryModel> historyList =
                apiHistoryController.listHistory;

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
                child: ListView.builder(
                  itemCount: apiHistoryController.listHistory.length,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var tagihan = historyList[index];
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
                                    nominalTagihan:
                                    nominalTagihanFormatted)
                                    : tagihan.jenisTagihan == "PLN"
                                    ? CardHistoryPLN(
                                    noTagihan: tagihan.noTagihan,
                                    jenisTagihan:
                                    tagihan.jenisTagihan,
                                    namaTagihan:
                                    tagihan.namaTagihan,
                                    waktuBayar:
                                    paymentDateFormatted,
                                    nominalTagihan:
                                    nominalTagihanFormatted)
                                    : tagihan.jenisTagihan == "PBB"
                                    ? CardHistoryPBB(
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
                                    "Mobil"
                                    ? CardHistoryMobil(
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
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
