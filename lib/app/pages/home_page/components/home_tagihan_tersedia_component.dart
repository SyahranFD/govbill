import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/global_component/defineTagihan.dart';
import 'package:govbill/app/global_component/no_bill_indicator.dart';
import 'package:govbill/app/pages/tagihan_tersedia_page/components/card_tagihan_tersedia.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';

class HomeTagihanTersediaComponent extends StatelessWidget {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

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
            Text("Tagihan Tersedia", style: tsBodyMediumSemiboldBlack),
            InkWell(
              onTap: () {
                Get.toNamed("/tagihan-tersedia");
              },
              child: Text("Selengkapnya", style: tsLabelMediumDarkBlue),
            ),
          ],
        ),
        SizedBox(height: 15),
        Obx(
          () => apiTagihanAkanDatangController.isLoading.value
              ? Container(
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : apiTagihanAkanDatangController.listTagihanAkanDatang.isEmpty
                  ? noBillIndicator(
                      context: context,
                      textIndicator: 'Tidak Ada Tagihan',
                    )
                  : ListView.builder(
                      itemCount: apiTagihanAkanDatangController.listTagihanAkanDatang.length > 2
                                  ? 2
                                  : apiTagihanAkanDatangController.listTagihanAkanDatang.length,
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

                        String namaNoTagihan =
                            defineNamaNoTagihan(tagihan.jenisTagihan!);
                        Color colorTagihan =
                            defineColorTagihan(tagihan.jenisTagihan!);

                        return Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    CardTagihanTersedia(
                                      namaNoTagihan: namaNoTagihan,
                                      colorTagihan: colorTagihan,
                                      noTagihan: tagihan.noTagihan,
                                      jenisTagihan: tagihan.jenisTagihan,
                                      namaTagihan: tagihan.namaTagihan,
                                      waktuBayar: paymentDateFormatted,
                                      nominalTagihan: nominalTagihanFormatted,
                                      isGagal: isStatusGagal(tagihan.status!),
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
      ],
    );
  }
}
