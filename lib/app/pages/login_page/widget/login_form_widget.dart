import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class LoginFormWidget extends StatelessWidget {
  final Widget? iconPrefix;
  final String? hintText;
  final bool? isObsecure;
  final Widget? iconSuffix;

  LoginFormWidget({
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
        obscureText: isObsecure ?? false,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            constraints: BoxConstraints(maxHeight: 55),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60,
              minHeight: 30,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            prefixIcon: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: iconPrefix),
            suffixIcon: Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
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
