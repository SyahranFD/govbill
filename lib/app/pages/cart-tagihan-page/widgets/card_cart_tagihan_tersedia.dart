import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/cart-tagihan-page/cart_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class CardCartTagihanTersedia extends GetView<CartPageController> {
  CardCartTagihanTersedia(
      {Key? key,
      required this.namaNoTagihan,
      required this.colorTagihan,
      required this.noTagihan,
      required this.jenisTagihan,
      required this.namaTagihan,
      required this.nominalTagihan,
      required this.isSelectedIdEmpty});

  final String? namaNoTagihan;
  final Color? colorTagihan;
  final String? noTagihan;
  final String? jenisTagihan;
  final String? namaTagihan;
  final String? nominalTagihan;
  final bool? isSelectedIdEmpty;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorTagihan,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  width: width * 0.1,
                  height: width * 0.1,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/icons/icKategori$jenisTagihan.svg",
                    width: 24,
                  ),
                ),
                SizedBox(width: width * 0.04),
                Container(
                  width: width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$namaNoTagihan : $noTagihan",
                          style: tsLabelRegularDarkBlue),
                      SizedBox(height: 3),
                      Text("$namaTagihan", style: tsBodySmallSemiboldBlack),
                      SizedBox(height: 3),
                      Text("$nominalTagihan", style: tsLabelRegularRed),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                width: width * 0.05,
                height: width * 0.05,
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        isSelectedIdEmpty != null
                            ? Container(
                          width: width * 0.036,
                          height: width * 0.036,
                          decoration: BoxDecoration(
                            color: successColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        )
                            : Container()
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
