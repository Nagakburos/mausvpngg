import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../controller/vpn/vpn_connection_controller.dart';
import '../../controller/vpn/vpn_location_controller.dart';
import '../../controller/theme/dark_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/default_button.dart';
import '../../utils/size.dart';
import '../drawer/drawer_screen.dart';

class VpnConnectScreen extends StatelessWidget {
   VpnConnectScreen({Key? key}) : super(key: key);

   final vpnController = Get.put(VPNLocationController());

   final controller = Get.put(VPNConnectionController());

   final darkController = Get.put(DarkThemeController());

   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: darkController.isDark.value ? CustomColor.dialogueBGColor : CustomColor.white,
      key: _scaffoldKey,
      drawer:  CustomDrawer(),
      appBar: AppBar(
        backgroundColor: darkController.isDark.value ? CustomColor.black : CustomColor.black,
        leading: InkWell(
          onTap: (){
            _scaffoldKey.currentState!.openDrawer();
          },
            child: Image.asset(IconPath.leadingPath)
        ),
        title: Text(
          Strings.appName.tr,
          style: CustomStyle.appbarTitleStyle,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => controller.vpnLocation(),
            child: Obx(() => Image.asset(vpnController.selectedLocationIcon.value)),
          ),
        ],
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
                  IconPath.vpnBGPath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                addVerticalSpace(53.h),
                Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Obx(() => Container(
                      width: 315.w,
                      height: 137.h,
                      decoration: BoxDecoration(
                        color: darkController.isDark.value ? CustomColor.secondaryColor : CustomColor.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 2),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addVerticalSpace(26.h),
                          Padding(
                            padding: EdgeInsets.only(left: 21.w, right: 23.w),
                            child: Row(
                              mainAxisAlignment: mainSpaceBet,
                              children: [
                                Text(
                                  Strings.connectionTime.tr,
                                  style:
                                      CustomStyle.vpnConnectionTitleTextStyle,
                                ),
                                Obx(() => Text(
                                  '${controller.hourRemaining.value}:${controller.minuteRemaining.value}:${controller.secondsRemaining.value}',
                                  style:
                                      CustomStyle.vpnConnectionTitleTextStyle,
                                ))
                              ],
                            ),
                          ),
                          addVerticalSpace(27.h),
                          Padding(
                            padding: EdgeInsets.only(left: 21.w, right: 23.w),
                            child: Text(
                              Strings.subscribeFor.tr,
                              style: CustomStyle.vpnConnectionSubtitleTextStyle,
                            ),
                          )
                        ],
                      ),
                    )),

                    Positioned(
                      bottom: -13.h,
                      left: 23.w,
                      child: SizedBox(
                        width: 269.w,
                        height: 48.h,
                        child: DefaultButton(
                          title: Strings.subscribe.tr,
                          onPresssed: () {},
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

          addVerticalSpace(10.h),

          GestureDetector(
            onTap: (){
              controller.vpnLocation();
            },
            child: Obx(() =>Container(
              alignment: Alignment.center,
              width: 315.w,
              height: 65.h,
              decoration: BoxDecoration(
                color: darkController.isDark.value ? CustomColor.secondaryColor : CustomColor.white,
                borderRadius:
                BorderRadius.circular(Dimensions.radius * 2),
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
              child: Obx(() => ListTile(
                leading: Image.asset(
                    vpnController.selectedLocationIcon.value
                ),
                title: Text(
                  vpnController.selectedLocation.value.tr,
                  style: CustomStyle.listTileTitleTextStyle,
                ),
                trailing:   Icon(Icons.arrow_forward_ios, color: CustomColor.primaryColor,),
              )),
            )),
          ),
          addVerticalSpace(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Row(
                  children: [
                    Text(
                      Strings.ip.tr,
                      style: CustomStyle.ipTextStyle,
                    ),
                    addHorizontalSpace(3.9.w),
                    Text(
                      Strings.ipaddress.tr,
                      style: darkController.isDark.value ? CustomStyle.speedTextStyleDark : CustomStyle.speedTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(IconPath.vpnUploadPath),
                    addHorizontalSpace(3.9.w),
                    Text(
                      Strings.uploadSpeed.tr,
                      style: darkController.isDark.value ? CustomStyle.speedTextStyleDark : CustomStyle.speedTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(IconPath.vpnDownloadPath),
                    addHorizontalSpace(3.9.w),
                    Text(
                      Strings.downloadSpeed.tr,
                      style: darkController.isDark.value ? CustomStyle.speedTextStyleDark : CustomStyle.speedTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          addVerticalSpace(10.h),
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
          addVerticalSpace(46.h),
          SizedBox(
            width: 315.w,
            height: 48.h,
            child: DefaultButton(
              title: Strings.disconnect.tr,
              onPresssed: () {
                controller.connectionReport();
              },
            ),
          )
        ],
      ),
    );
  }
}
