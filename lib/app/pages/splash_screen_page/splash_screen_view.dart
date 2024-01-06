import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class SplashScreenPageView extends StatelessWidget {
  const SplashScreenPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
