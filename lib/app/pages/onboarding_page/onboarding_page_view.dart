import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/onboarding_page/widget/onboard_button_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class OnboardingPageView extends GetView<OnboardingPageController> {
  OnboardingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.onboardingData.length,
              onPageChanged: (value) {
                controller.currentPage.value = value;
              },
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
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //     width: 55,
          //     height: 55,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: secondaryColor,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 250,
          // ),

          Obx(
            () => controller.currentPage.value == 2
                ? Column(
                    children: [
                      OnboardButtonWidget(
                        onTap: () {},
                        margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                        title: "Daftar",
                        textStyle: tsBodyMediumSemiboldWhite,
                        color: secondaryColor,
                      ),
                      OnboardButtonWidget(
                        onTap: () {},
                        title: "Login",
                        margin:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        textStyle: tsBodyMediumSemiboldDarkGrey,
                        color: primaryColor,
                      ),
                    ],
                  )
                : SizedBox(
                    height: 148,
                  ),
          ),
          Obx(() => Container(
                margin: EdgeInsets.only(right: 15, bottom: 15, left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Skip",
                            style: tsBodyMediumRegularDarkGrey,
                          )),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            controller.onboardingData.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currentPage.value == index
                                    ? secondaryColor // Active dot color
                                    : primaryColor, // Inactive dot color
                              ),
                            ),
                          );
                        })),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
