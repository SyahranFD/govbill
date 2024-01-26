import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

Widget noBillIndicator({required context, required String textIndicator}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: DottedBorder(
      color: darkGrey,
      borderType: BorderType.RRect,
      radius: Radius.circular(15),
      strokeWidth: 2,
      dashPattern: [15, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          height: 78.5,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textIndicator,
                style: tsBodySmallSemiboldBlueGrey,
              ),
              SizedBox(width: 30),
              Image.asset(
                'assets/icons/icShadowNothing.png',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
