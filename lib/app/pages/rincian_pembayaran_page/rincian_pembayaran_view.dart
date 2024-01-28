import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/common/helper/themes.dart';

class RincianPembayaranPageView extends StatelessWidget {
  const RincianPembayaranPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Rincian Pembayaran",
          style: tsBodyLargeSemiboldWhite,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              "assets/icons/icArrowBack.svg",
              color: primaryColor,
            )),
        backgroundColor: secondaryColor,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Image.asset("assets/images/elipse1.png")),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 40),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text(
                                    "Total Tagihan",
                                    style: tsBodyMediumRegularBlack,
                                  ),
                                  Text(
                                    "Rp 200.000",
                                    style: tsHeadlineLargeBoldBlack,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  left: 0, right: 0, top: 35, bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: grey, width: 1)),
                            ),
                            Text(
                              "Metode Pembayaran",
                              style: tsBodySmallMediumBlack,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Image.asset("assets/images/elipse2.png"),
                        top: 30,
                        right: 0,
                      ),
                      Positioned(
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: categoryPLN),
                        ),
                        top: 100,
                        left: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
