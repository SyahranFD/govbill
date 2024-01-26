import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/authentication_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';

class SplashScreenPageView extends StatelessWidget {
   final SplashScreenPageController postMetodePembayaranController =
      Get.put(SplashScreenPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}
