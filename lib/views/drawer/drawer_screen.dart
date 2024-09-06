import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/drawer/drawer_controller.dart';
import '../../controller/theme/dark_controller.dart';
import '../../models/menu_item_model.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../utils/size.dart';
import 'drawer_menu_items.dart';

class CustomDrawer extends GetView<CustomDrawerController> {
  CustomDrawer({Key? key}) : super(key: key);

  final darkController = Get.put(DarkThemeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomDrawerController>(builder: (controller) {
      return customDrawer(context);
    });
  }

  Widget customDrawer(context) {
    return SafeArea(
      bottom: false,
      child: Container(
        decoration: darkController.isDark.value
            ? CustomStyle.gradientBgDark
            : CustomStyle.gradientBg,
        child: Drawer(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 21.7.h,
                  right: 28.w,
                ),
                child: Row(
                  mainAxisAlignment: mainEnd,
                  children: [
                    // SizedBox(
                    //   width: 12.27.w,
                    //   height: 12.27.h,
                    //   child: IconButton(
                    //     icon: const Icon(Icons.close),
                    //     color: CustomColor.primaryColor,
                    //     onPressed: () {
                    //       Get.back();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: crossCenter,
                children: [
                  appIconWidget(),
                  // Text(
                  //   Strings.name.tr,
                  //   style: CustomStyle.drawerTitleStyle,
                  // ),
                  // Text(
                  //   Strings.id.tr,
                  //   style: CustomStyle.drawerSubtitleStyle,
                  // ),
                ],
              ),
              addVerticalSpace(35.5.h),
              ...MenuItems.all.map(buildMenuItem).toList(),
            ],
          ),
        ),
      ),
    );
  }

  profileAvatar() {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: 71.w,
            height: 71.h,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                width: 65.w,
                height: 65.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: ExactAssetImage(IconPath.avatarPath),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            right: 2.w,
            child: Container(
              width: 14.w,
              height: 14.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: Colors.transparent,
                ),
                color: CustomColor.onlineColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  appIconWidget() {
    return Container(
      height: 100.h,
      width: 100.w,
      child: Image.asset(IconPath.appLauncher),
    );
  }

  buildMenuItem(MenuItemModel item) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        children: [
          ListTileTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius * 3),
                bottomLeft: Radius.circular(Dimensions.radius * 3),
              ),
            ),
            selectedTileColor: Colors.white.withOpacity(.2),
            child: ListTile(
              contentPadding: EdgeInsets.only(right: 15.w),
              selected: controller.currentItem == item,
              leading: Padding(
                padding: EdgeInsets.only(
                  left: 23.3.w,
                ),
                child: SizedBox(
                  height: 17.09.h,
                  child: Icon(item.icon),
                ),
              ),
              title: Text(
                item.title.tr,
                style: CustomStyle.drawerTileStyle,
                textAlign: TextAlign.start,
              ),
              onTap: () {
                controller.onSelectedItem(item);
                Get.toNamed(controller.getScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
