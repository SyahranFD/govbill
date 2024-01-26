import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/pages/home_page/components/home_category_component.dart';
import 'package:govbill/app/pages/home_page/components/home_history_component.dart';
import 'package:govbill/app/pages/home_page/components/home_tagihan_akan_datang_component.dart';
import 'package:govbill/app/pages/home_page/components/home_total_tagihan_component.dart';
import 'package:govbill/app/pages/home_page/home_page_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class HomePageView extends StatelessWidget {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Obx(() {
        final bool isLoading = apiTagihanAkanDatangController.isLoading.value;

        return RefreshIndicator(
          onRefresh: () => controller.refreshData(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                HomeTotalTagihanComponent(),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 280),
                  padding: EdgeInsets.only(top: 35, left: width * 0.05, right: width * 0.05),
                  decoration: BoxDecoration(
                    color: backgroundPageColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )
                  ),
                  child: Column(
                    children: [
                      HomeCategoryComponent(),
                      SizedBox(height: 30),
                      HomeTagihanAkanDatangComponent(),
                      SizedBox(height: 30),
                      HomeHistoryComponent(),
                      SizedBox(height: 75),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
