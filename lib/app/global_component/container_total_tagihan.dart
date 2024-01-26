import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/cart-metode-pembayaran-page/cart_metode_pembayaran_controller.dart';
import 'package:govbill/app/pages/cart-tagihan-page/cart_controller.dart';
import 'package:govbill/common/helper/themes.dart';

Widget ContainerTotalTagihan({required context, required String route, required bool isListTagihan}) {
  final CartPageController cartController = Get.put(CartPageController());
  final CartMetodePembayaranPageController cartMetodePembayaranPageController =
      Get.put(CartMetodePembayaranPageController());

  final Size mediaQuery = MediaQuery.of(context).size;
  final double height = mediaQuery.height;
  final double width = mediaQuery.height;

  return Positioned(
    left: 0,
    right: 0,
    bottom: 0,
    child: Obx(() => Container(
          height: height * 0.125,
          padding: EdgeInsets.symmetric(horizontal: width * 0.025),
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Tagihan', style: tsBodySmallRegularBlack),
                  Text(cartController.totalSelectedNominal.value, style: tsTitleSmallSemiboldBlack),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(route);
                  isListTagihan ? cartMetodePembayaranPageController.addDefaultToSelectedId() : null;
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.015),
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text('Lanjut', style: tsBodyMediumSemiboldWhite),
              ),
            ],
          ),
        )),
  );
}
