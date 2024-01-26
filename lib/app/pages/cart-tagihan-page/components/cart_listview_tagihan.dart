import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/global_component/defineTagihan.dart';
import 'package:govbill/app/pages/cart-tagihan-page/cart_controller.dart';
import 'package:govbill/app/pages/cart-tagihan-page/widgets/card_cart_tagihan_tersedia.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';

class CartListViewTagihan extends StatelessWidget {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());
  final CartPageController cartPageController = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Obx(
      () => apiTagihanAkanDatangController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : apiTagihanAkanDatangController.listTagihanAkanDatang.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 100,
                  child: Text("Tidak Ada Tagihan",
                      style: tsBodyMediumRegularDarkGrey),
                )
              : Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 15, left: width * 0.05, right: width * 0.05),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: apiTagihanAkanDatangController
                          .listTagihanAkanDatang.length,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var tagihan = apiTagihanAkanDatangController
                            .listTagihanAkanDatang[index];

                        var nominalTagihanFormatted = NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp ',
                        ).format(tagihan.nominalTagihan);
                        nominalTagihanFormatted = nominalTagihanFormatted.replaceAll(",00", "");

                        String namaNoTagihan = defineNamaNoTagihan(tagihan.jenisTagihan!);
                        Color colorTagihan = defineColorTagihan(tagihan.jenisTagihan!);


                        return InkWell(
                            onTap: () {
                              cartPageController.addToSelectedId(tagihan.id!);
                              print(cartPageController.selectedId);
                            },
                            child: Container(
                              width: double.infinity,
                              child: CardCartTagihanTersedia(
                                namaNoTagihan: namaNoTagihan,
                                colorTagihan: colorTagihan,
                                noTagihan: tagihan.noTagihan,
                                jenisTagihan: tagihan.jenisTagihan,
                                namaTagihan: tagihan.namaTagihan,
                                nominalTagihan: nominalTagihanFormatted,
                                id: tagihan.id,
                              ),
                            ),
                          );
                      },
                    ),
                  ),
                ),
    );
  }
}
