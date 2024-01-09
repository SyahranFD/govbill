import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/common/helper/themes.dart';

class TagihanCardWidget extends StatelessWidget {
  final Widget? iconLeft;
  final Widget? iconRight;
  final String? titleLeft;
  final String? titleRight;
  final Color? colorLeft;
  final Color? colorRight;

  TagihanCardWidget(
      {Key? key,
      this.iconLeft,
      this.iconRight,
      this.titleLeft,
      this.titleRight,
      this.colorLeft,
      this.colorRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.72,
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: colorLeft,
                      borderRadius: BorderRadius.circular(10)),
                  child: iconLeft,
                ),
              ),
              Container(
                width: 140,
                alignment: Alignment.center,
                child: Text(
                  titleLeft!,
                  style: tsBodyMediumSemiboldBlack,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: colorRight,
                      borderRadius: BorderRadius.circular(10)),
                  child: iconRight,
                ),
              ),
              Container(
                  width: 140,
                  alignment: Alignment.center,
                  child: Text(
                    titleRight!,
                    style: tsBodyMediumSemiboldBlack,
                    textAlign: TextAlign.center,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
