import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  static var buttonTextStyle = TextStyle(
    fontSize: Dimensions.buttonTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static var gradientBg =   BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        CustomColor.bgGradietStartColor,
        CustomColor.bgGradietEndColor,
      ],
    ),
  );

  static var gradientBgDark =   const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        CustomColor.dialogueBGColor,
        CustomColor.bgGradietEndColor,
      ],
    ),
  );

  static var appbarTitleStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  //? Onboard Style
  static var onboardSkipStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var onboardTitleStyle = TextStyle(
    fontSize: Dimensions.onboardTitleTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static var onboardTitleStyle2 = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    color: CustomColor.primaryColor,
  );
  static var onboardTitleStyle3 = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.bold,
    color: CustomColor.primaryColor,
  );

  //? Auth Screen

  static var welcomeTitleStyle = TextStyle(
    fontSize: Dimensions.biggestTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static var inputTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static var hintTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.5),
  );

  static var labelTextStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static var newToVPNTextStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    color: Colors.white,
  );
  static var incorrectPassTextStyle = TextStyle(
    fontSize: Dimensions.bigTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static var enteredPassIncorrectTextStyle = TextStyle(
    fontSize: Dimensions.enteredPassIncorrectTextSize,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var backToSigninTextStyle = TextStyle(
    fontSize: Dimensions.backToSigninTextSize,
    color: Colors.white,
  );

  static var fotgotPassTextStyle = TextStyle(
    fontSize: Dimensions.biggestTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static var fotgotPassSubtitleTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
    color: Colors.white.withOpacity(0.8),
  );

  static var otpTextStyle = TextStyle(
    fontSize: Dimensions.otpTextSize,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  //? Welcome Screen
  static var skipTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var welcomeTitleTextStyle = TextStyle(
    fontSize: Dimensions.welcomeTitleTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static var welcomeSubtitleTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static var welcomeFooter1TextStyle = TextStyle(
    fontSize: Dimensions.welcomeFooter1TextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.8),
  );

  static var welcomeFooter2TextStyle = TextStyle(
    fontSize: Dimensions.welcomeFooter2TextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.5),
  );

  static var bottomSheetPaymentNameStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  //? Dashboard Screen
  static var dashboardTitleTextStyle = TextStyle(
    fontSize: Dimensions.dashboardTitleTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  //? Connection Onboard Screen
  static var connectionOnboardTitleTextStyle = TextStyle(
    fontSize: Dimensions.connectionOnboardTitleTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  //? Vpn Connection Screen
  static var vpnConnectionTitleTextStyle = TextStyle(
    color: CustomColor.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimensions.vpnConnectionTitleTextSize,
  );

  static var vpnConnectionSubtitleTextStyle = TextStyle(
    color: CustomColor.primaryColor.withOpacity(0.8),
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w500,
  );

  static var listTileTitleTextStyle = TextStyle(
    color: CustomColor.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimensions.mediumTextSize,
  );

  static var ipTextStyle = TextStyle(
    color: CustomColor.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimensions.smallTextSize,
  );
  static var speedTextStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimensions.smallTextSize,
  );
  static var speedTextStyleDark = TextStyle(
    color: Colors.white70,
    fontSize: Dimensions.smallTextSize,
  );

  static var ratingTitleTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    color: CustomColor.primaryColor,
    fontWeight: FontWeight.bold,
  );

  //? Connection Report Screen

  static var reportTitleTextStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    color: CustomColor.primaryColor,
    fontWeight: FontWeight.bold,
  );

  static var reportSubtitleTextStyle = TextStyle(
    fontSize: Dimensions.connectionReportSubtitleTextSize,
    color: CustomColor.primaryColor.withOpacity(0.6),
  );

  //? Upgrade To Premium Screen

  static var upgradeTitleTextStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: CustomColor.packageCardSideColor,
    fontWeight: FontWeight.bold,
  );

  static var upgradeTrailingTextStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    color: CustomColor.packageCardSideColor,
  );

  static var upgradeFooter1TextStyle = TextStyle(
    fontSize: Dimensions.welcomeFooter1TextSize,
    fontWeight: FontWeight.w500,
    color: CustomColor.primaryColor.withOpacity(0.8),
  );

  static var upgradefooter2TextStyle = TextStyle(
    fontSize: Dimensions.welcomeFooter2TextSize,
    color: CustomColor.primaryColor.withOpacity(0.5),
  );

  //? Drawer Screen
  static var drawerTitleStyle = TextStyle(
    fontSize: Dimensions.drawerHeaderTitleTextSize,
    fontWeight: FontWeight.w900,
    color: CustomColor.packageCardSideColor,
  );
  static var drawerSubtitleStyle = TextStyle(
    fontSize: Dimensions.drawerHeaderSubtitleTextSize,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.7),
  );
  static var drawerTileStyle = TextStyle(
    fontSize: Dimensions.drawerTileTextSize,
    fontWeight: FontWeight.w500,
    color: CustomColor.packageCardSideColor,
  );


  //? Welcome Screen
  static var vpnSpeedStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );


  //? tab to connect home screen
  static var tabToConnectTitleTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );


  static var countrySubtitleTextStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.bold,
    color: Colors.white70,
  );
}
