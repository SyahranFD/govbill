import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_profile_controller.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/pages/cart-tagihan-page/cart_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class HomeTotalTagihanComponent extends StatelessWidget {
  final ApiProfileController apiProfileController =
      Get.put(ApiProfileController());
  final ApiTagihanAkanDatangController fetchTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());
  final CartPageController cartPageController = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Container(
      width: double.infinity,
      height: 330,
      color: secondaryColor,
      padding: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              "assets/icons/icBlobTopLeft.svg",
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/icons/icBlobTopRight.svg",
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              "assets/icons/icBlobBottomLeft.svg",
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hello, ",
                        style: tsBodyMediumSemiboldWhite,
                      ),
                      TextSpan(
                        text: apiProfileController.listProfile.isNotEmpty
                            ? apiProfileController.listProfile[0].username! +
                                " 👋"
                            : "",
                        style: tsBodyMediumRegularWhite,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                IntrinsicWidth(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color:
                          fetchTagihanAkanDatangController.totalGagal.value > 0
                              ? gagalColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: fetchTagihanAkanDatangController.totalGagal.value > 0
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.warning_amber_rounded,
                                  color: primaryColor, size: 16),
                              SizedBox(width: 5),
                              Text(
                                "${fetchTagihanAkanDatangController.totalGagal.value} Pembayaran Gagal",
                                style: tsLabelSemiboldWhite,
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                    child: Column(
                  children: [
                    Text("Total Tagihan", style: tsBodySmallMediumWhite),
                    SizedBox(height: 0),
                    Obx(() {
                      String totalNominal = fetchTagihanAkanDatangController.totalNominal.value;

                      return totalNominal == 'Rp 0'
                          ? Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text('Semua Tagihan Lunas  🎉', style: tsTitleMediumSemiboldWhite))
                          : Text(totalNominal, style: tsHeadlineLargeBoldWhite);
                    }),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/tagihan-tersedia");
                          },
                          child: Container(
                            height: 33,
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            decoration: BoxDecoration(
                              color: smoothGreen,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text("Lihat Detail",
                                style: tsLabelSemiboldWhite),
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        InkWell(
                          onTap: () {
                            cartPageController.addAllToSelected();
                            cartPageController.calculateTotalSelectedNominal();
                            Get.toNamed("/cart");
                          },
                          child: Container(
                            height: 33,
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            decoration: BoxDecoration(
                              color: smoothGreen,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text("Bayar Sekarang",
                                style: tsLabelSemiboldWhite),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
