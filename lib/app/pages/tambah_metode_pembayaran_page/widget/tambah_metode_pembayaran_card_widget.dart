import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/common/helper/themes.dart';

class PembayaranCard extends StatelessWidget {
  final String? title;
  final Widget? iconPrefix;
  final String? route;
  PembayaranCard({Key? key, this.title, this.iconPrefix, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.toNamed(route!);
        },
        child: Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: iconPrefix),
              Text(
                title!,
                style: tsBodySmallSemiboldBlack,
              )
            ],
          ),
        ));
  }
}
