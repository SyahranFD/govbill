import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class TextfieldTanggalTagihan extends StatelessWidget {
  TextfieldTanggalTagihan({
    super.key,
    this.fieldController,
    required this.obscureText,
    required this.hintText,
    this.validator,
    required this.keyboardType,
  });

  final TextEditingController? fieldController;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Function? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        fillColor: primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
        ),
        hintText: hintText,
        hintStyle: tsBodySmallMediumDarkGrey,
      ),
      cursorColor: secondaryColor,
      validator: validator as String? Function(String?)?,
    );
  }
}
