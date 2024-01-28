import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/model/history_model.dart';
import 'package:govbill/app/global_component/defineTagihan.dart';
import 'package:govbill/app/pages/history_page/components/card_history.dart';
import 'package:govbill/app/pages/history_page/history_page_controller.dart';
import 'package:govbill/app/global_component/no_bill_indicator.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/dropdown_date_widget.dart';
import 'package:govbill/common/helper/themes.dart';

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
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
                    minNumber: 0,
                    maxNumber: 32,
                    onChanged: (value) {
                      if (value == 0) {
                        controller.onSearch.value = false;
                        controller.tanggalDipilih.value = 0;
                        controller.refreshData();
                      } else {
                        controller.onSearch.value = true;
                        controller.tanggalDipilih.value = value!;
                        controller.refreshData();
                      }
                    },
                  )
                ],
              ),
            ),
            Obx(
              () {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<HistoryModel> historyList = controller.listHistory;
                  if (historyList.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: noBillIndicator(
                        context: context,
                        textIndicator: 'Tidak Ada History',
                      ),
                    );
                  }
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 15, left: width * 0.05, right: width * 0.05),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: ListView.builder(
                        itemCount: controller.listHistory.length,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var tagihan = historyList[index];
                          String namaNoTagihan =
                              defineNamaNoTagihan(tagihan.jenisTagihan!);
                          Color colorTagihan =
                              defineColorTagihan(tagihan.jenisTagihan!);
                          print(tagihan.namaTagihan);
                          if (controller.onSearch.value == true) {
                            if (tagihan.waktuBayar!.day ==
                                controller.tanggalDipilih.value) {
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
                                              jenisTagihan:
                                                  tagihan.jenisTagihan,
                                              namaTagihan: tagihan.namaTagihan,
                                              waktuBayar: controller.dateFormat(
                                                  date: tagihan.waktuBayar),
                                              nominalTagihan:
                                                  controller.currencyFormat(
                                                      nominal: tagihan
                                                          .nominalTagihan!))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          } else {
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
                                            waktuBayar: controller.dateFormat(
                                                date: tagihan.waktuBayar),
                                            nominalTagihan:
                                                controller.currencyFormat(
                                                    nominal: tagihan
                                                        .nominalTagihan!))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
