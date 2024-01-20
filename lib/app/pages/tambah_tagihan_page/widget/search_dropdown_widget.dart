import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:searchfield/searchfield.dart';

class SearchDropdownWidget extends StatelessWidget {
  final Key? key;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final double? width;
  final double? height;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<SearchFieldListItem<dynamic>>? suggestions;
  final EdgeInsetsGeometry? padding;
  SearchDropdownWidget({
    this.key,
    this.hintText,
    this.contentPadding,
    this.width,
    this.height,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.suggestions,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchField(
      suggestionStyle: tsBodySmallRegularBlack,
      onSaved: onSaved,
      searchInputDecoration: InputDecoration(
          hintText: hintText,
          hintStyle: tsBodySmallMediumDarkGrey,
          fillColor: primaryColor,
          filled: true,
          contentPadding: contentPadding,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor, width: 2),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
      suggestionsDecoration: SuggestionDecoration(
        color: primaryColor,
        padding: padding ?? EdgeInsets.zero,
      ),
      suggestionItemDecoration:
          BoxDecoration(border: Border(bottom: BorderSide.none)),
      suggestions: suggestions!,
    );
  }
}
