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
  final String? routeLeft;
  final String? routeRight;

  TagihanCardWidget(
      {Key? key,
      this.iconLeft,
      this.iconRight,
      this.titleLeft,
      this.titleRight,
      this.colorLeft,
      this.colorRight,
      this.routeLeft,
      this.routeRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.77,
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(routeLeft!);
                },
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                      color: colorLeft,
                      borderRadius: BorderRadius.circular(10)),
                  child: iconLeft,
                ),
              ),
              SizedBox(height: 10),
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
                onTap: () {
                  Get.toNamed(routeRight!);
                },
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                      color: colorRight,
                      borderRadius: BorderRadius.circular(10)),
                  child: iconRight,
                ),
              ),
              SizedBox(height: 10),
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
