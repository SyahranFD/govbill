import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_metode_pembayaran_controller.dart';
import 'package:govbill/app/pages/cart-metode-pembayaran-page/cart_metode_pembayaran_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:govbill/common/routes/app_pages.dart';
import 'package:intl/intl.dart';

class CartListViewMetodePembayaran extends StatelessWidget {
  final ApiMetodePembayaranController apiMetodePembayaranController =
      Get.put(ApiMetodePembayaranController());
  final MetodePembayaranPageController metodePembayaranPageController =
      Get.put(MetodePembayaranPageController());
  final CartMetodePembayaranPageController controller =
      Get.put(CartMetodePembayaranPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(() {
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

                    return InkWell(
                      onTap: () {
                        controller.addToSelectedId(data.id!);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 25, bottom: 25),
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
                                    ],
                                  ),
                                )
                              ],
                            ),

                            Container(
                              width: width * 0.05,
                              height: width * 0.05,
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    bool isSelected = controller.isIdSelected(data.id!);
                                    return isSelected
                                        ? Container(
                                      width: width * 0.036,
                                      height: width * 0.036,
                                      decoration: BoxDecoration(
                                        color: successColor,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    )
                                        : Container();
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
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
    });
  }
}
