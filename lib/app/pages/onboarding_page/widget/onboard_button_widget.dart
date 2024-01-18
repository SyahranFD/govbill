import 'package:flutter/material.dart';

class OnboardButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? color;
  OnboardButtonWidget(
      {Key? key, this.onTap, this.title, this.margin, this.padding, this.textStyle, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: margin,
        padding: padding,
        height: 55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title ?? "",
          style: textStyle,
        ),
      ),
    );
  }
}
