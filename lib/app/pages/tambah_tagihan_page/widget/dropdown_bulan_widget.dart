import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class DropdownBulanWidget extends StatelessWidget {
  final Key? key;
  final String? hintText;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Key? formKey;
  final List<String> items;
  DropdownBulanWidget({
    this.key,
    this.hintText,
    this.onChanged,
    this.validator,
    this.formKey,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: items,
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
          constraints: BoxConstraints(maxWidth: 130, maxHeight: 40),
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
