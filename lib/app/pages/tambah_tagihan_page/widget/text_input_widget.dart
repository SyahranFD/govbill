import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:govbill/common/helper/themes.dart';

class TextInputWidget extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final double? height;
  final double? width;

  TextInputWidget(
      {Key? key,
      this.hintText,
      this.keyboard,
      this.inputFormatters,
      this.height,
      this.width,
      this.padding,
      this.textAlign,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      decoration: InputDecoration(
          fillColor: primaryColor,
          constraints: BoxConstraints(
              minHeight: height ?? double.infinity,
              maxHeight: height ?? double.infinity,
              minWidth: width ?? double.infinity,
              maxWidth: width ?? double.infinity),
          contentPadding: padding,
          filled: true,
          hintText: hintText,
          hintStyle: tsBodySmallMediumDarkGrey,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor, width: 2),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
