import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class RegisterFormWidget extends StatelessWidget {
  final Widget? iconPrefix;
  final String? hintText;
  final bool? isObsecure;
  final Widget? iconSuffix;

  RegisterFormWidget({
    Key? key,
    this.iconPrefix,
    this.hintText,
    this.isObsecure,
    this.iconSuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 55),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60,
              minHeight: 30,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
            fillColor: primaryColor,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            hintStyle: tsLabelRegularDarkGrey),
      ),
    );
  }
}
