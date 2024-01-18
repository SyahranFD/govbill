import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/common/helper/themes.dart';

class HomeTotalTagihanComponent extends StatelessWidget {

  const HomeTotalTagihanComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello,", style: tsTitleMediumSemiboldBlack),
        Text("Radya Harbani", style: tsBodySmallRegularBlack),
        SizedBox(height: 25),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
              color: smoothGreen,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total tagihan yang akan dibayar", style: tsBodySmallRegularLightGrey),
              Text("Rp 200.000", style: tsTitleSmallSemiboldWhite),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                    child: Text("Lihat Detail", style: tsLabelSemiboldBlueGrey),
                  )
                ],
              )
            ],
          )
        ),
      ],
    );
  }
}