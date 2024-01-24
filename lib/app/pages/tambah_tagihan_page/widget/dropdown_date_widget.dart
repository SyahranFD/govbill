import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class DropdownDateWidget extends StatelessWidget {
  final int? maxNumber;
  final String? hintText;
  final void Function(int?)? onChanged;
  final String? Function(int?)? validator;
  final int? minNumber;
  final Key? formKey;
  DropdownDateWidget({
    Key? key,
    this.maxNumber,
    this.hintText,
    this.onChanged,
    this.minNumber,
    this.validator,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownSearch<int>(
        items: List.generate(maxNumber!, (index) => index + minNumber!),
        // dropdownBuilder: (context, selectedItem) {
        //   return Container(
        //     alignment: Alignment.center,
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Text(selectedItem ?? ''),
        //   );
        // },

        validator: validator,

        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            isDense: true,
            constraints: BoxConstraints(
              maxWidth: 75,
            ),
            fillColor: primaryColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            filled: true,
            hintText: hintText ?? "",
            hintStyle: tsBodySmallMediumDarkGrey,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
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
