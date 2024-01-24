import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/pages/home_page/components/home_category_component.dart';
import 'package:govbill/app/pages/home_page/components/home_history_component.dart';
import 'package:govbill/app/pages/home_page/components/home_menyambut_user_component.dart';
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
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 60,
              left: width * 0.05,
              right: width * 0.05,
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  HomeMenyambutUserComponent(),
                  SizedBox(height: 30),
                  HomeTotalTagihanComponent(),
                  SizedBox(height: 30),
                  HomeCategoryComponent(),
                  SizedBox(height: 30),
                  HomeTagihanAkanDatangComponent(),
                  SizedBox(height: 30),
                  HomeHistoryComponent(),
                  SizedBox(height: 75),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
