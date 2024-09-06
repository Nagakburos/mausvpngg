import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_vpn_app/helper/pref_helper.dart';

import '../../controller/theme/dark_controller.dart';
import '../../routes/routes.dart';
import '../../utils/custom_style.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/default_button.dart';
import '../../utils/size.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final darkController = Get.put(DarkThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      width: 360.w,
      height: 690.h,
      decoration: darkController.isDark.value
          ? CustomStyle.gradientBgDark
          : CustomStyle.gradientBg,
      child: Column(
        children: [
          addVerticalSpace(58.2.h),
          Padding(
            padding: EdgeInsets.only(right: 28.2.w),
            child: Row(
              mainAxisAlignment: mainEnd,
              children: [
                InkWell(
                  onTap: () {
                    PrefHelper.saveIntroStatus(isCompleted: true);
                    Get.offNamedUntil(Routes.homeScreen, (route) => false);
                  },
                  child: Text(
                    Strings.skip.tr,
                    style: CustomStyle.skipTextStyle,
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(51.5.h),
          addVerticalSpace(56.9.h),
          Padding(
            padding: EdgeInsets.only(left: 91.w),
            child: Image.asset(IconPath.welcomePath),
          ),
          Text(
            Strings.fastSpeed.tr,
            style: CustomStyle.welcomeSubtitleTextStyle,
          ),
          addVerticalSpace(78.h),
          SizedBox(
            width: 315.w,
            height: 48.h,
            child: DefaultButton(
              title: Strings.startFreeTrial.tr,
              onPresssed: () {
                PrefHelper.saveIntroStatus(isCompleted: true);
                Get.offNamedUntil(Routes.homeScreen, (route) => false);
              },
            ),
          ),
          addVerticalSpace(21.h),
          Text(
            Strings.agreeTerms.tr,
            style: CustomStyle.welcomeFooter2TextStyle,
          ),
        ],
      ),
    );
  }
}
