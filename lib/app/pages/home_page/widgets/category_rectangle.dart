import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/common/helper/themes.dart';

Widget categoryRectangle({required context, required colorCategory, required String jenisTagihan}) {
  final Size mediaQuery = MediaQuery.of(context).size;
  final double width = mediaQuery.width;
  final double height = mediaQuery.height;

  return Container(
    width: width * 0.225,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorCategory,
            borderRadius: BorderRadius.circular(13),
          ),
          width: width * 0.15,
          height: width * 0.15,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/icons/icKategori$jenisTagihan.svg",
            width: width * 0.075,
          ),
        ),
        SizedBox(height: 5),
        Text(jenisTagihan, style: tsBodySmallSemiboldBlack)
      ],
    ),
  );
}
