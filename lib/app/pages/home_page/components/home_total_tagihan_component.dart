import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/pages/home_page/home_page_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class HomeTotalTagihanComponent extends StatelessWidget {
  final ApiTagihanAkanDatangController fetchTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello,", style: tsTitleMediumSemiboldBlack),
        Text("Radya Harbani", style: tsBodySmallRegularBlack),
        SizedBox(height: 25),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
                color: smoothGreen, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total tagihan yang akan dibayar",
                    style: tsBodySmallRegularLightGrey),
                Obx(() => Text(
                      fetchTagihanAkanDatangController.totalNominal.value,
                      style: tsTitleSmallSemiboldWhite,
                    )),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.toNamed("/tagihan-akan-datang");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                        child: Text("Lihat Detail", style: tsLabelSemiboldBlueGrey),
                      ),
                    ],
                  ),
                )

              ],
            )),
      ],
    );
  }
}
