import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/api/model/history_model.dart';
import 'package:govbill/app/global_component/defineTagihan.dart';
import 'package:govbill/app/pages/history_page/components/card_history.dart';
import 'package:govbill/app/pages/history_page/history_page_controller.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';

class HistoryPageView extends StatelessWidget {
  final ApiHistoryController apiHistoryController =
      Get.put(ApiHistoryController());
  final HistoryPageController historyPageController =
      Get.put(HistoryPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return RefreshIndicator(
      onRefresh: () => historyPageController.refreshData(),
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
                  physics: AlwaysScrollableScrollPhysics(),
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

                      String namaNoTagihan = defineNamaNoTagihan(tagihan.jenisTagihan!);
                      Color colorTagihan = defineColorTagihan(tagihan.jenisTagihan!);

                      return Container(
                        margin: EdgeInsets.only(bottom: 0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  CardHistory(
                                    namaNoTagihan: namaNoTagihan,
                                    colorTagihan: colorTagihan,
                                    noTagihan: tagihan.noTagihan,
                                    jenisTagihan: tagihan.jenisTagihan,
                                    namaTagihan: tagihan.namaTagihan,
                                    waktuBayar: paymentDateFormatted,
                                    nominalTagihan: nominalTagihanFormatted,
                                  ),
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
