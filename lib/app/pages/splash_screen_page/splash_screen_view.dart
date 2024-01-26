import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';

class SplashScreenPageView extends StatelessWidget {
   final SplashScreenPageController postMetodePembayaranController =
      Get.put(SplashScreenPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Center(
        child: Container(
          width: width * 0.5,
          child: SvgPicture.asset(
            "assets/icons/icLogoGovbill.svg",
            width: width * 0.5,
          ),
        ),
      ),
    );
  }
}
