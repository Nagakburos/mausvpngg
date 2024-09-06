import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/vpn/vpn_location_controller.dart';
import '../../controller/theme/dark_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../utils/size.dart';

class ConnectionReportScreen extends StatelessWidget {
   ConnectionReportScreen({Key? key}) : super(key: key);

  final vpnController = Get.put(VPNLocationController());

   final darkController = Get.put(DarkThemeController());

   final data = Get.arguments;

  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: darkController.isDark.value ? CustomColor.dialogueBGColor : CustomColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          Strings.connectionReport.tr,
          style: CustomStyle.appbarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: _bodyWidget(context),
    ));
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 690.h,
      child: Column(
        children: [
          Container(
            height: 239.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  IconPath.vpnConnectPath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                addVerticalSpace(103.h),
                Obx(() => Container(
                  width: 315.w,
                  height: 124.h,
                  decoration: BoxDecoration(
                    color: darkController.isDark.value ? CustomColor.secondaryColor : CustomColor.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 10,
                        offset: const Offset(0, 7),
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: mainCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          mainAxisAlignment: mainSpaceBet,
                          children: [
                            Column(
                              mainAxisAlignment: mainCenter,
                              children: [
                                SvgPicture.asset(
                                  IconPath.globePath,
                                ),
                                addVerticalSpace(8.h),
                                Obx(() => Text(
                                  vpnController.selectedLocation.value,
                                  style: CustomStyle.reportTitleTextStyle,
                                )),
                                addVerticalSpace(2.h),
                                Text(
                                  Strings.ipaddress.tr,
                                  style: CustomStyle.reportSubtitleTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: mainCenter,
                              children: [
                                SvgPicture.asset(
                                  IconPath.durationPath,
                                ),
                                addVerticalSpace(8.h),
                                Text(
                                  Strings.duration.tr,
                                  style: CustomStyle.reportTitleTextStyle,
                                ),
                                addVerticalSpace(2.h),
                                Text(
                                  data,
                                  style: CustomStyle.reportSubtitleTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: mainCenter,
                              children: [
                                SvgPicture.asset(
                                  IconPath.dataUsedPath,
                                ),
                                addVerticalSpace(8.h),
                                Text(
                                  Strings.dataUsed.tr,
                                  style: CustomStyle.reportTitleTextStyle,
                                ),
                                addVerticalSpace(2.h),
                                Text(
                                  Strings.dataUsedValue.tr,
                                  style: CustomStyle.reportSubtitleTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          addVerticalSpace(33.h),
          Obx(() => Container(
            width: 315.w,
            height: 113.h,
            decoration: BoxDecoration(
              color: darkController.isDark.value ? CustomColor.secondaryColor : CustomColor.white,
              borderRadius: BorderRadius.circular(Dimensions.radius * 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(0, 7),
                  // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                addVerticalSpace(28.h),
                Text(
                  Strings.giveRating.tr,
                  style: CustomStyle.ratingTitleTextStyle,
                ),
                addVerticalSpace(20.h),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
