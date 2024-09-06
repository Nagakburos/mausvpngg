import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';

class CountryIconWidget extends StatelessWidget {
  const CountryIconWidget({
    Key? key,
    required this.hintText,
    required this.initialSelection,
    required this.title,
    required this.controller,
    this.showFlag = false,
    this.showCountryOnly = true,
    this.keyboardType,
    this.stroke = 0,
    this.onChanged,
  }) : super(key: key);

  final bool showFlag;
  final String initialSelection;
  final bool showCountryOnly;
  final String hintText, title;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;
  final double stroke;

  static String? countryName = "";

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      padding: const EdgeInsets.all(0),
      onChanged: onChanged,
      backgroundColor: CustomColor.primaryColor.withOpacity(0.03),
      onInit: (code) => {countryName = code?.name},
      showFlag: true,
      hideMainText: true,
      enabled: true,
      initialSelection: initialSelection,
      showFlagDialog: false,
    );
  }
}
