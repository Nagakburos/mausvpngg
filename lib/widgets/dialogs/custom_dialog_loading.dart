import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../loading/custom_loading_api.dart';

class CustomDialogLoading {
  static show() {
    return Get.dialog(
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
        alignment: Alignment.center,
        child: CustomLoadingAPI(),
      ),
    );
  }
}
