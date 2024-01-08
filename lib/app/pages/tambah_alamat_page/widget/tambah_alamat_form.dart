import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:govbill/common/helper/themes.dart';

class TextfieldTambahAlamat extends StatelessWidget {
  TextfieldTambahAlamat({
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: fieldController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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
      ),
    );
  }
}
