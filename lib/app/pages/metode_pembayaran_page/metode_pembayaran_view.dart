import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_metode_pembayaran_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/metode_pembayaran_page/widgets/popup_menu_metode_pembayaran.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:govbill/common/routes/app_pages.dart';
import 'package:intl/intl.dart';

class MetodePembayaranPageView extends StatelessWidget {
  final ApiMetodePembayaranController apiMetodePembayaranController =
      Get.put(ApiMetodePembayaranController());
  final MetodePembayaranPageController metodePembayaranPageController =
      Get.put(MetodePembayaranPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return RefreshIndicator(
      onRefresh: () => metodePembayaranPageController.refreshData(),
      child: Scaffold(
        backgroundColor: backgroundPageColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundPageColor,
          toolbarHeight: 75,
          centerTitle: true,
          title: Text("Metode Pembayaran", style: tsBodyLargeSemiboldBlack),
        ),
        body: Obx(() {
          if (apiMetodePembayaranController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: categoryPLN,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: primaryColor,
                            size: 30,
                          ),
                          Text(
                            "Klik Icon Menu Untuk Mengubah Pembayaran Utama",
                            style: tsLabelRegularWhite,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    ListView.builder(
                      itemCount: apiMetodePembayaranController
                          .listMetodePembayaran.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var data = apiMetodePembayaranController
                            .listMetodePembayaran[index];
                        var jenisKartu = data.jenis;

                        var saldoFormatted =
                            NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                                .format(data.saldo);
                        saldoFormatted = saldoFormatted.replaceAll(",00", "");

                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              data.pembayaranUtama == 1
                                  ? Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: smoothGreen,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              "Pembayaran Utama",
                                              style: tsLabelSemiboldWhite,
                                            ),
                                          ),
                                          popupMenuMetodePembayaran(context: context, id: data.id.toString(), index: index),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                              Container(
                                margin: data.pembayaranUtama == 1
                                    ? EdgeInsets.only(top: 10, bottom: 25)
                                    : EdgeInsets.only(top: 25, bottom: 25),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: SvgPicture.asset(
                                        "assets/icons/ic$jenisKartu.svg",
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          metodePembayaranPageController
                                              .formatCardNumber(data.nomor!),
                                          style: tsLabelMediumBlueGrey,
                                        ),
                                        Text(
                                          data.nama!,
                                          style: tsLabelMediumBlueGrey,
                                        ),
                                        Text(
                                          "Saldo : " + saldoFormatted,
                                          style: tsBodySmallSemiboldBlack,
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    data.pembayaranUtama == 1
                                        ? SizedBox()
                                        : popupMenuMetodePembayaran(context: context, id: data.id.toString(), index: index),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.TAMBAH_KARTU_PAGE),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Tambahkan Metode Pembayaran Lain",
                          style: tsBodySmallSemiboldWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    )
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
