import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../controller/vpn/vpn_location_controller.dart';
import '../../helper/admob_helper.dart';
import '../../routes/routes.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/local_storage.dart';
import '../../utils/strings.dart';
import '../../utils/size.dart';
import '../../widgets/loading/custom_loading_api.dart';

class VpnLocationScreen extends StatelessWidget {
  VpnLocationScreen({Key? key}) : super(key: key);

  final controller = Get.put(VPNLocationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.darkController.isDark.value
            ? CustomColor.dialogueBGColor
            : CustomColor.black,
        appBar: AppBar(
          backgroundColor: controller.darkController.isDark.value
              ? CustomColor.primaryColor.withOpacity(0.5)
              : CustomColor.primaryColor,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            Strings.vpnLocations.tr,
            style: CustomStyle.appbarTitleStyle,
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                controller.getVpnData();
              },
              child: SvgPicture.asset(IconPath.vpnReloadPath),
            ),
            addHorizontalSpace(20.w),
          ],
        ),
        body: Obx(() {
          return controller.isLoading
              ? const CustomLoadingAPI()
              : controller.vpnList.isEmpty
                  ? _noVpnFoundWidget(context)
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
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.vpnList.length,
              itemBuilder: (context, index) {
                var data = controller.vpnList[index];

                return listTileItem(
                    countryName: data.countryLong,
                    imageName:
                        "assets/flags/${data.countryShort!.toLowerCase()}.png",
                    speed: data.speed,
                    people: data.numVpnSessions.toString(),
                    index: index,
                    onTap: () {
                      controller.selectedLocation.value =
                          data.countryLong.toString();
                      controller.selectedLocationIcon.value =
                          "assets/flags/${data.countryShort!.toLowerCase()}.png";
                      controller.index.value = index;

                      LocalStorage.vpnSingleDataRemove();
                      LocalStorage.saveVpnSingleData(vpnSingleData: [data]);

                      AdMobHelper.getInterstitialAdLoadAndShow(
                          onCompleted: () async {
                        await Get.offAllNamed(Routes.homeScreen);
                      });
                    });
              },
            ),
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
      {required countryName,
      required imageName,
      required speed,
      required people,
      required onTap,
      required index}) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      onTap: onTap,
      child: Container(
        height: 65.h,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.5),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.5,
            vertical: Dimensions.marginSizeVertical * 0.3),
        decoration: BoxDecoration(
          color: CustomColor.mediumColor,
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
                      height: 35.h,
                      width: 60.w,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          image: DecorationImage(image: AssetImage(imageName))),
                    ),
                    Column(
                      mainAxisAlignment: mainCenter,
                      crossAxisAlignment: crossStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            countryName,
                            style: CustomStyle.listTileTitleTextStyle,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.speed_rounded,
                              color: CustomColor.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                _forMateBytes(speed, 1),
                                style: CustomStyle.vpnSpeedStyle,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(
                          people,
                          style: CustomStyle.vpnSpeedStyle,
                        ),
                      ),
                      Icon(
                        Icons.people_outline,
                        color: CustomColor.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _forMateBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ['Bps', 'Kbps', 'Mbps', 'Gbps', 'Tbps'];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  _noVpnFoundWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("VPNs Not Found"),
    );
  }
}
