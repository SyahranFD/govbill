import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/global_component/container_total_tagihan.dart';
import 'package:govbill/app/global_component/no_bill_indicator.dart';
import 'package:govbill/app/pages/cart-tagihan-page/cart_controller.dart';
import 'package:govbill/app/pages/cart-tagihan-page/components/cart_listview_tagihan.dart';
import 'package:govbill/common/helper/themes.dart';

class CartPageView extends StatelessWidget {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());
  final CartPageController cartPageController = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("List Tagihan", style: tsBodyLargeSemiboldBlack),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: blackColor,
          ),
        ),
      ),
      body: Obx(
        () => apiTagihanAkanDatangController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : apiTagihanAkanDatangController.listTagihanAkanDatang.isEmpty
                ? Container(
                    margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: noBillIndicator(
                      context: context,
                      textIndicator: 'Tidak Ada Tagihan',
                    ),
                )
                : Container(
                    width: double.infinity,
                    height: height,
                  child: Stack(
                      children: [
                        CartListViewTagihan(),
                        ContainerTotalTagihan(
                            context: context,
                            route: '/cart-metode-pembayaran',
                            isListTagihan: true)
                      ],
                    ),
                ),
      ),
    );
  }
}
