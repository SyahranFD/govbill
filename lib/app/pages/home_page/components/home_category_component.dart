import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/home_page/widgets/category_rectangle.dart';
import 'package:govbill/common/helper/themes.dart';

class HomeCategoryComponent extends StatelessWidget {

  const HomeCategoryComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      children: [
        Row(
          children: [
            categoryRectangle(context: context, colorCategory: categoryMotor, jenisTagihan: "Motor"),
            categoryRectangle(context: context, colorCategory: categoryMobil, jenisTagihan: "Mobil"),
            categoryRectangle(context: context, colorCategory: categoryPBB, jenisTagihan: "PBB"),
            categoryRectangle(context: context, colorCategory: categoryPLN, jenisTagihan: "PLN"),
          ],
        ),

        SizedBox(height: 18),

        Row(
          children: [
            categoryRectangle(context: context, colorCategory: categoryPGN, jenisTagihan: "PGN"),
            categoryRectangle(context: context, colorCategory: categoryBPJS, jenisTagihan: "BPJS"),
            categoryRectangle(context: context, colorCategory: categoryPDAM, jenisTagihan: "PDAM"),
          ],
        )
      ],
    );
  }
}