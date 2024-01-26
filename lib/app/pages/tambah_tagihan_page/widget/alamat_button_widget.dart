import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:govbill/common/helper/themes.dart';

class AlamatButtonWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? catatan;
  final void Function()? onTap;
  const AlamatButtonWidget({
    Key? key,
    required this.title,
    required this.description,
    this.onTap,
    this.catatan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
        // constraints: BoxConstraints(minHeight: 50, maxHeight: 150),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: Get.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: tsBodySmallSemiboldBlueGrey,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    style: tsLabelRegularDarkGrey,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Catatan : ${catatan!}",
                    style: tsLabelSemiboldBlueGrey,
                  ),
                ],
              ),
            ),
            Spacer(),
            Transform.rotate(
              angle: 3.14 / 1,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/icArrowBack.svg"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
