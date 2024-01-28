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
import 'package:govbill/app/pages/history_page/history_page_controller.dart';
import 'package:govbill/app/pages/history_page/history_page_view.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeHistoryComponent extends StatelessWidget {
  final ApiHistoryController apiHistoryController =
  Get.put(ApiHistoryController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryPageController());
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Pembayaran Terakhir", style: tsBodyMediumSemiboldBlack),
            InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: HistoryPageView(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Text("Selengkapnya", style: tsLabelMediumDarkBlue),
            ),
          ],
        ),
        SizedBox(height: 15),
        Obx(
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

              return ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var tagihan = historyList[index];

                  return Container(
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
                            : Container(),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
