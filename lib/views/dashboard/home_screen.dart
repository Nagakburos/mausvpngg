import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../backend/model/vpn/vpn_status.dart';
import '../../backend/services/vpn_engine.dart';
import '../../controller/dashboard/home_controller.dart';
import '../../helper/admob_helper.dart';
import '../../routes/routes.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../views/drawer/drawer_screen.dart';
import '../../widgets/dialogs/custom_dialog.dart';
import '../../widgets/home/home_card.dart';
import '../../utils/size.dart';
import '../../widgets/loading/custom_loading_api.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ///Add listener to update vpn state
    VpnEngine.vpnStageSnapshot().listen((event) {
      controller.vpnState.value = event;
    });

    return Obx(() {
      return Scaffold(
        backgroundColor: controller.darkController.isDark.value
            ? CustomColor.dialogueBGColor
            : CustomColor.black, // cores fundo
        drawer: CustomDrawer(),
        endDrawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: controller.darkController.isDark.value
              ? CustomColor.black
              : CustomColor.primaryColor,
          leading: InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Image.asset(IconPath.leadingPath)),
          title: Text(
            Strings.appName.tr,
            style: CustomStyle.appbarTitleStyle,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  AdMobHelper.getInterstitialAdLoadAndShow(
                      onCompleted: () async {
                    await Get.toNamed(Routes.vpnLocationScreen);
                  });
                },
                icon: Image.asset(IconPath.trailingPath)),
          ],
        ),
        body: controller.isLoading
            ? CustomLoadingAPI()
            : Container(
                width: double.infinity,
                height: double.infinity,
                // alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSize),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(IconPath.bgPath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Column(
                      children: [
                        Obx(() {
                          return _vpnButton(context);
                        }),

                        //count down timer
                        // Obx(() {
                        //   return CountDownTimer(
                        //       startTimer: controller.vpnState.value ==
                        //           VpnEngine.vpnConnected);
                        // }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        HomeCard(
                          title: controller
                                  .singleVpnData.first.countryLong!.isEmpty
                              ? 'Country'
                              : controller.singleVpnData.first.countryLong!
                                  .toLowerCase(),
                          subtitle: "FREE",
                          icon: controller
                                  .singleVpnData.first.countryShort!.isEmpty
                              ? CircleAvatar(
                                  radius: 35.r,
                                  backgroundColor: CustomColor.primaryColor,
                                  child: Icon(
                                    Icons.vpn_lock_rounded,
                                    size: 40.r,
                                  ),
                                )
                              : Container(
                                  height: 35.h,
                                  width: 60.w,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/flags/${controller.singleVpnData.first.countryShort!.toLowerCase()}.png"))),
                                ),
                        ),
                        HomeCard(
                          title: controller.singleVpnData.first.ping!
                                  .toString()
                                  .isEmpty
                              ? '0 ms'
                              : controller.singleVpnData.first.ping!.toString(),
                          subtitle: "PING",
                          icon: CircleAvatar(
                            radius: 35.r,
                            backgroundColor: CustomColor.primaryColor,
                            child: Icon(
                              Icons.equalizer_outlined,
                              size: 40.r,
                            ),
                          ),
                        )
                      ],
                    ),
                    StreamBuilder<VpnStatus?>(
                      initialData: VpnStatus(),
                      stream: VpnEngine.vpnStatusSnapshot(),
                      builder: (context, snapshot) => Row(
                        mainAxisAlignment: mainSpaceBet,
                        children: [
                          HomeCard(
                            title: '${snapshot.data?.byteIn ?? "0 Kbps"}',
                            subtitle: "DOWNLOAD",
                            icon: CircleAvatar(
                              radius: 35.r,
                              backgroundColor: CustomColor.primaryColor,
                              child: Icon(
                                Icons.arrow_circle_down_rounded,
                                size: 40.r,
                              ),
                            ),
                          ),
                          HomeCard(
                            title: '${snapshot.data?.byteOut ?? "0 Kbps"}',
                            subtitle: "UPLOAD",
                            icon: CircleAvatar(
                              radius: 35.r,
                              backgroundColor: CustomColor.primaryColor,
                              child: Icon(
                                Icons.arrow_circle_up_rounded,
                                size: 40.r,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }

  _vpnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Semantics(
            button: true,
            child: InkWell(
              onTap: () {
                if (controller.vpnState.value == VpnEngine.vpnDisconnected) {
                  CustomDialog.show(
                    title: "Connecting Alert",
                    subtitle:
                        "Your VPN is currently in the process of connecting. This secure connection helps protect your online privacy and ensures your data remains encrypted. Please allow a moment for the connection to be established.",
                    rightButtonName: 'OK',
                    leftButtonName: 'Cancel',
                    cancelOnTap: () {
                      Get.back();
                    },
                    confirmOnTap: () {
                      Get.back();
                      controller.connectToVpn(
                          openVpnConfigDataBase64:
                              controller.openVpnConfigDataBase64.value,
                          country: controller.countryName.value);
                    },
                  );
                } else {
                  controller.connectToVpn(
                      openVpnConfigDataBase64:
                          controller.openVpnConfigDataBase64.value,
                      country: controller.countryName.value);
                }
              },
              borderRadius: BorderRadius.circular(160.r),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.getButtonColor.withOpacity(0.1)),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.getButtonColor.withOpacity(0.3)),
                  child: Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.getButtonColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconPath.worldPath),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.getButtonText,
                            style: CustomStyle.tabToConnectTitleTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //connection status label
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                controller.vpnState.value == VpnEngine.vpnDisconnected
                    ? "Not Connected"
                    : controller.vpnState.replaceAll('_', ' ').toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
