import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/theme/dark_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/strings.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final darkController = Get.put(DarkThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: darkController.isDark.value
              ? CustomColor.dialogueBGColor
              : CustomColor.white,
          body: _bodyWidget(context),
        ));
  }

  _bodyWidget(BuildContext context) {
    return Center(
        child: Image.asset(
      IconPath.appLauncher,
      height: 100.h,
    ));
  }
}
