import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/theme/dark_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/strings.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final darkController = Get.put(DarkThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: darkController.isDark.value
              ? CustomColor.dialogueBGColor
              : CustomColor.bgGradietEndColor,
          appBar: AppBar(
            backgroundColor: darkController.isDark.value
                ? CustomColor.black
                : CustomColor.primaryColor,
            leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              Strings.settings.tr,
              style: CustomStyle.appbarTitleStyle,
            ),
            centerTitle: true,
          ),
          body: _bodyWidget(context),
        ));
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        Obx(() => SwitchListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 23.w),
              value: darkController.isDark.value,
              secondary: Icon(
                  darkController.isDark.value
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                  color: CustomColor.packageCardSideColor),
              title: Text(
                Strings.themeChange.tr,
                style: CustomStyle.drawerTitleStyle,
              ),
              onChanged: (value) {
                darkController.goToChangeTheme(value);
              },
            )),
      ],
    );
  }
}
