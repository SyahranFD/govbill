import 'package:flutter/widgets.dart';
import 'package:govbill/common/helper/themes.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
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
        child: Text(
          title!,
          style: tsBodyMediumSemiboldWhite,
        ),
      ),
    );
  }
}
