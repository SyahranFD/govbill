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
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownSearch<String>(
        items: items,
        // dropdownBuilder: (context, selectedItem) {
        //   return Container(
        //     alignment: Alignment.center,
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Text(selectedItem ?? ''),
        //   );hjuurrr
        // },

        validator: validator,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            // isCollapsed: true,
            isDense: true,
            constraints: BoxConstraints(maxWidth: 130),
            fillColor: primaryColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            hintText: hintText ?? "",
            hintStyle: tsBodySmallMediumDarkGrey,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderSide: formKey != null &&
                      (formKey as GlobalKey<FormState>)
                              .currentState
                              ?.validate() ==
                          true
                  ? BorderSide.none
                  : BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
