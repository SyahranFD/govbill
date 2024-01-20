import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class DropdownDateWidget extends StatelessWidget {
  final int? maxNumber;
  final String? hintText;
  final void Function(int?)? onChanged;
  final String? Function(int?)? validator;
  final Key? formKey;
  DropdownDateWidget({
    Key? key,
    this.maxNumber,
    this.hintText,
    this.onChanged,
    this.validator,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<int>(
      items: List.generate(20, (index) => index + 1),
      // dropdownBuilder: (context, selectedItem) {
      //   return Container(
      //     alignment: Alignment.center,
      //     padding: EdgeInsets.symmetric(horizontal: 16),
      //     child: Text(selectedItem ?? ''),
      //   );
      // },
      key: formKey,
      validator: validator,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          constraints: BoxConstraints(maxWidth: 60, maxHeight: 40),
          fillColor: primaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          hintText: hintText ?? "",
          hintStyle: tsBodySmallMediumDarkGrey,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
