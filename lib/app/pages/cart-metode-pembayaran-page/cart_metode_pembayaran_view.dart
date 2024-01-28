import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/global_component/container_total_tagihan.dart';
import 'package:govbill/app/pages/cart-metode-pembayaran-page/components/cart_listview_metode_pembayaran.dart';
import 'package:govbill/common/helper/themes.dart';

class CartMetodePembayaranPageView extends StatelessWidget {

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
        title: Text("Pilih Metode Pembayaran", style: tsBodyLargeSemiboldBlack),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: height,
        child: Stack(
          children: [
            CartListViewMetodePembayaran(),
            ContainerTotalTagihan(context: context, route: '', isListTagihan: false)
          ],
        ),
      ),
    );
  }
}
