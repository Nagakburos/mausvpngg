import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class CustomDialog {
  static show(
      {required String title,
      required String subtitle,
      required String rightButtonName,
      required String leftButtonName,
      required VoidCallback cancelOnTap,
      required VoidCallback confirmOnTap}) {
    return Get.defaultDialog(
        backgroundColor: CustomColor.white,
        title: title,
        titleStyle: GoogleFonts.inter(
          fontSize: Dimensions.headingTextSize2,
          fontWeight: FontWeight.bold,
          color: CustomColor.black,
        ),
        content: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: Dimensions.headingTextSize3 * 1.06,
            fontWeight: FontWeight.w500,
            color: CustomColor.black.withOpacity(0.6),
          ),
        ),
        confirm: TextButton(
            onPressed: confirmOnTap,
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
              decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                rightButtonName,
                style: GoogleFonts.inter(
                  fontSize: Dimensions.headingTextSize3 * 1.06,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.white,
                ),
              ),
            )),
        cancel: TextButton(
            onPressed: cancelOnTap,
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
              decoration: BoxDecoration(
                  color: CustomColor.black,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                leftButtonName,
                style: GoogleFonts.inter(
                  fontSize: Dimensions.headingTextSize3 * 1.06,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.white,
                ),
              ),
            )),
        radius: 10.0);
  }
}
