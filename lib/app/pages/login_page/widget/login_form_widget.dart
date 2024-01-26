import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class LoginFormWidget extends StatelessWidget {
  final Widget? iconPrefix;
  final Key? formKey;
  final String? hintText;
  final bool? isObsecure;
  final Widget? iconSuffix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? readOnly;

  LoginFormWidget({
    Key? key,
    this.iconPrefix,
    this.hintText,
    this.formKey,
    this.validator,
    this.isObsecure,
    this.iconSuffix,
    this.controller,
    this.readOnly
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
<<<<<<< HEAD
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: controller,
          obscureText: isObsecure ?? false,
          validator: validator,
          decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              // constraints: BoxConstraints(maxHeight: 55),
              prefixIconConstraints: BoxConstraints(
                minWidth: 60,
                minHeight: 30,
              ),
              
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              prefixIcon: iconPrefix,
              suffixIcon: Container(
=======
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure ?? false,
        readOnly: readOnly ?? false,
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
>>>>>>> c4a4a9fdc3e3a2bdadf0efe2234c33da2084d7b5
                height: 20,
                width: 20,
                alignment: Alignment.center,
            
                child: iconSuffix,
              ),
              fillColor: primaryColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                  borderSide: formKey != null &&
                          (formKey as GlobalKey<FormState>)
                                  .currentState
                                  ?.validate() ==
                              true
                      ? BorderSide.none
                      : BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              hintStyle: tsLabelRegularDarkGrey),
        ),
      ),
    );
  }
}
