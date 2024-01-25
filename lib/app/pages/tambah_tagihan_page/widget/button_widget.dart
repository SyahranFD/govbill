import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final bool? isLoading;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Alignment? alignment;
  final double? width;
  final double? height;
  const ButtonWidget(
      {Key? key,
      this.onTap,
      this.alignment,
      this.title,
      this.isLoading,
      this.margin,
      this.padding,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: isLoading == true
            ? Transform.scale(
                scale: 0.5,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: primaryColor,
                ),
              )
            : Text(
          title!,
          style: tsBodyMediumSemiboldWhite,
        ),
      ),
    );
  }
}
