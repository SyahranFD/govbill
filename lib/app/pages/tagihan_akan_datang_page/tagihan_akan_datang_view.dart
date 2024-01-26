import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_bpjs.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_mobil.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_motor.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pbb.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pdam.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pgn.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pln.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';

class TagihanAkanDatangPageView extends StatelessWidget {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

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
        title: Text("Tagihan Tersedia", style: tsBodyLargeSemiboldBlack),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: blackColor,
          ),
        ),
      ),
      body: Obx(
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
                  margin: EdgeInsets.only(top: 15, left: width * 0.05, right: width * 0.05),
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
                                          ? CardTagihanAkanDatangBPJS(
                                          noTagihan: tagihan.noTagihan,
                                          jenisTagihan: tagihan.jenisTagihan,
                                          namaTagihan: tagihan.namaTagihan,
                                          waktuBayar: paymentDateFormatted,
                                          nominalTagihan:
                                          nominalTagihanFormatted)
                                          : tagihan.jenisTagihan == "PDAM"
                                          ? CardTagihanAkanDatangPDAM(
                                          noTagihan: tagihan.noTagihan,
                                          jenisTagihan:
                                          tagihan.jenisTagihan,
                                          namaTagihan: tagihan.namaTagihan,
                                          waktuBayar: paymentDateFormatted,
                                          nominalTagihan:
                                          nominalTagihanFormatted)
                                          : tagihan.jenisTagihan == "PLN"
                                          ? CardTagihanAkanDatangPLN(
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
                                          ? CardTagihanAkanDatangPBB(
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
                                          : tagihan.jenisTagihan == "Mobil"
                                          ? CardTagihanAkanDatangMobil(
                                          noTagihan:
                                          tagihan.noTagihan,
                                          jenisTagihan: tagihan.jenisTagihan,
                                          namaTagihan: tagihan.namaTagihan,
                                          waktuBayar:
                                          paymentDateFormatted,
                                          nominalTagihan:
                                          nominalTagihanFormatted)
                                          : tagihan.jenisTagihan == "Motor"
                                          ? CardTagihanAkanDatangMotor(
                                          noTagihan: tagihan.noTagihan,
                                          jenisTagihan: tagihan.jenisTagihan,
                                          namaTagihan: tagihan.namaTagihan,
                                          waktuBayar:
                                          paymentDateFormatted,
                                          nominalTagihan:
                                          nominalTagihanFormatted)
                                          : tagihan.jenisTagihan == "PGN"
                                          ? CardTagihanAkanDatangPGN(
                                          noTagihan: tagihan.noTagihan,
                                          jenisTagihan:
                                          tagihan.jenisTagihan,
                                          namaTagihan:
                                          tagihan.namaTagihan,
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
                ),
      ),
    );
  }
}
