import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:shimmer/shimmer.dart';

class AlamatShimmer extends StatelessWidget {
  const AlamatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget skelton({double? height, double? width}) {
      return Container(
        height: height ?? 20,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.circular(10)),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      height: 200,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            skelton(height: 20, width: 60),
            SizedBox(
              height: 10,
            ),
            skelton(height: 25, width: 200),
            SizedBox(
              height: 10,
            ),
            skelton(height: 50, width: double.infinity),
            SizedBox(
              height: 10,
            ),
            skelton(height: 20, width: 200),
          ],
        ),
      ),
    );
  }
}
