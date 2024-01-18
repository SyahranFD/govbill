import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';

class OnboardingPageView extends GetView<OnboardingPageController> {
  OnboardingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          controller.onboardingData[index]["image"]!,
                          height: 250,
                          width: 250,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.onboardingData[index]["title"]!,
                          style: tsTitleLargeSemiboldDarkBlue,
                        ),
                        Text(
                          controller.onboardingData[index]["description"]!,
                          style: tsBodyMediumRegularDarkGrey,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 250,
          ),
        ],
      ),
    );
  }
}
