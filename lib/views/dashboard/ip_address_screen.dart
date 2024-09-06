import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../controller/dashboard/ip_address_controller.dart';
import '../../helper/admob_helper.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../utils/size.dart';
import '../../widgets/loading/custom_loading_api.dart';

class IpAddressScreen extends StatelessWidget {
  IpAddressScreen({Key? key}) : super(key: key);

  final controller = Get.put(IpAddressController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.darkController.isDark.value
            ? CustomColor.dialogueBGColor
            : CustomColor.white,
        appBar: AppBar(
          backgroundColor: controller.darkController.isDark.value
              ? CustomColor.primaryColor.withOpacity(0.5)
              : CustomColor.primaryColor,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            Strings.currentLocation.tr,
            style: CustomStyle.appbarTitleStyle,
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                controller.getIpAddressData();
              },
              child: SvgPicture.asset(IconPath.vpnReloadPath),
            ),
            addHorizontalSpace(20.w),
          ],
        ),
        body: Obx(() {
          return controller.isLoading
              ? CustomLoadingAPI()
              : _bodyWidget(context);
        }),
      );
    });
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      // width: 360.w,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: AdWidget(
              ad: AdMobHelper.getBannerAd()..load(),
              key: UniqueKey(),
            ),
          ),
          listTileItem(
            title: "IP Address",
            icon: Icon(Icons.pin_drop_rounded, color: Colors.blue, size: 40),
            subTitle: controller.ipAddressModel.query,
          ),
          listTileItem(
            title: "Internet Provider",
            icon:
                Icon(Icons.location_city, color: Colors.orangeAccent, size: 40),
            subTitle: controller.ipAddressModel.isp,
          ),
          listTileItem(
            title: "Location",
            icon: Icon(Icons.my_location, color: Colors.pinkAccent, size: 40),
            subTitle: controller.ipAddressModel.country.isEmpty
                ? 'Fetching...'
                : "${controller.ipAddressModel.city}, ${controller.ipAddressModel.regionName}, ${controller.ipAddressModel.country}",
          ),
          listTileItem(
            title: "Pin-code",
            icon: Icon(Icons.password, color: Colors.blueAccent, size: 40),
            subTitle: controller.ipAddressModel.zip,
          ),
          listTileItem(
            title: "Timezone",
            icon: Icon(Icons.access_time, color: Colors.greenAccent, size: 40),
            subTitle: controller.ipAddressModel.timezone,
          ),
          SizedBox(
            height: 50.h,
            child: AdWidget(
              ad: AdMobHelper.getBannerAd()..load(),
              key: UniqueKey(),
            ),
          )
        ],
      ),
    );
  }

  listTileItem(
      {required String title, required Icon icon, required String subTitle}) {
    return Container(
      height: 65.h,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.5),
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.5,
          vertical: Dimensions.marginSizeVertical * 0.3),
      decoration: BoxDecoration(
        color: CustomColor.white,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Row(
                mainAxisAlignment: mainCenter,
                crossAxisAlignment: crossCenter,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          right: Dimensions.marginSizeHorizontal * 0.2),
                      child: icon),
                  Column(
                    mainAxisAlignment: mainCenter,
                    crossAxisAlignment: crossStart,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          title,
                          style: CustomStyle.listTileTitleTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          subTitle,
                          style: CustomStyle.vpnSpeedStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
