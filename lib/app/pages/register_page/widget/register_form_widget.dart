import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govbill/common/helper/themes.dart';

class RegisterFormWidget extends StatelessWidget {
  final Widget? iconPrefix;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? isObsecure;
  final Key? formKey;
  final Widget? iconSuffix;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  RegisterFormWidget({
    Key? key,
    this.iconPrefix,
    this.hintText,
    this.validator,
    this.isObsecure,
    this.inputFormatters,
    this.iconSuffix,
    this.formKey,
    this.keyboardType,
    this.autovalidateMode,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 15),
      child: Form(
        key: formKey,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        child: TextFormField(
          maxLines: 1,
          validator: validator,
          controller: controller,
          obscureText: isObsecure ?? false,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              constraints: BoxConstraints(maxHeight: 70, minHeight: 65),
              prefixIconConstraints: BoxConstraints(
                minWidth: 60,
                minHeight: 30,
              ),
              
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              prefixIcon: Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: iconPrefix),
              suffixIcon: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(right: 15),
                child: iconSuffix,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: primaryColor,
              filled: true,
              hintText: hintText,
              border: OutlineInputBorder(
                  borderSide: (formKey as GlobalKey<FormState>)
                              .currentState
                              ?.validate() ==
                          true
                      ? BorderSide.none
                      : BorderSide(color: Colors.red, width: 2),
                  // borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              hintStyle: tsLabelRegularDarkGrey),
        ),
      ),
    );
  }
}
