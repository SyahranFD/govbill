import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govbill/common/helper/themes.dart';

class TextInputWidget extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboard;
  final Key? formKey;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
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
      this.formKey,
      this.validator,
      this.padding,
      this.textAlign,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        keyboardType: keyboard,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            fillColor: primaryColor,
            // constraints: BoxConstraints(
            //     minHeight: height ?? double.infinity,
            //     maxHeight: height ?? double.infinity,
            //     minWidth: width ?? double.infinity,
            //     maxWidth: width ?? double.infinity),
            contentPadding: padding,
            filled: true,
            hintText: hintText,
            hintStyle: tsBodySmallMediumDarkGrey,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 2),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide: formKey != null &&
                        (formKey as GlobalKey<FormState>)
                                .currentState
                                ?.validate() ==
                            true
                    ? BorderSide.none
                    : BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
