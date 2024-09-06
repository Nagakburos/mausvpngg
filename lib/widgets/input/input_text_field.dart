import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.keyboardType,
     this.prefix,
     this.suffix,
    this.obSecured = false
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final bool obSecured;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecured,
      autofocus: false,
      controller: controller,
      style: CustomStyle.inputTextStyle,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      onSaved: (value) => controller.text = value!,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: CustomStyle.hintTextStyle,
        labelText: labelText,
        labelStyle: CustomStyle.labelTextStyle,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.8.w,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),

        prefixIcon: prefix,
        suffixIcon: suffix

      ),
    );
  }
}
