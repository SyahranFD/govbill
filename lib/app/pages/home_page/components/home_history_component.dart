import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/api/model/history_model.dart';
import 'package:govbill/app/global_component/defineTagihan.dart';
import 'package:govbill/app/pages/history_page/components/card_history.dart';
import 'package:govbill/app/pages/history_page/history_page_view.dart';
import 'package:govbill/app/global_component/no_bill_indicator.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeHistoryComponent extends StatelessWidget {
  final ApiHistoryController apiHistoryController =
      Get.put(ApiHistoryController());

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
            if (apiHistoryController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final List<HistoryModel> historyList =
                  apiHistoryController.listHistory;

              if (historyList.isEmpty) {
                return noBillIndicator(
                  context: context,
                  textIndicator: 'Tidak Ada Riwayat',
                );
              }

              return ListView.builder(
                itemCount: apiHistoryController.listHistory.length > 2
                    ? 2
                    : apiHistoryController.listHistory.length,
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

                  String namaNoTagihan =
                      defineNamaNoTagihan(tagihan.jenisTagihan!);
                  Color colorTagihan =
                      defineColorTagihan(tagihan.jenisTagihan!);

                  return Container(
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
