import 'package:get/get.dart';

import '../binding/home_binding.dart';
import '../binding/vpn_location_binding.dart';
import '../config/app_config.dart';
import '../utils/strings.dart';
import '../views/dashboard/connection_report_screen.dart';
import '../views/dashboard/home_screen.dart';
import '../views/dashboard/ip_address_screen.dart';
import '../views/dashboard/vpn_connect_screen.dart';
import '../views/dashboard/vpn_location_screen.dart';
import '../views/webview/webview_screen.dart';
import '../views/welcome/welcome_screen.dart';

import '../binding/splash_binding.dart';

import '../views/settings/settings_screen.dart';
import '../views/splash/splash_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String vpnConnectScreen = '/vpnConnectScreen';
  static const String connectionReportScreen = '/connectionReportScreen';
  static const String vpnLocationScreen = '/vpnLocationScreen';
  static const String ipAddressScreen = '/ipAddressScreen';
  static const String settingsScreen = '/settingsScreen';

  static const String customDrawerScreen = '/customDrawerScreen';
  static const String homeScreen = '/homeScreen';

  static const String privacyPolicy = '/privacyPolicy';
  static const String aboutUs = '/aboutUs';

  static var list = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: welcomeScreen,
      page: () => WelcomeScreen(),
      // binding: DashboardBinding()
    ),

    GetPage(
      name: vpnConnectScreen,
      page: () => VpnConnectScreen(),
    ),
    GetPage(
      name: connectionReportScreen,
      page: () => ConnectionReportScreen(),
    ),
    GetPage(
      name: vpnLocationScreen,
      page: () => VpnLocationScreen(),
      binding: VpnLocationBinding(),
    ),

    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
    ),
    GetPage(name: homeScreen, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
      name: ipAddressScreen,
      page: () => IpAddressScreen(),
    ),

    //privacy policy
    GetPage(
      name: Routes.privacyPolicy,
      page: () => WebPaymentScreen(
        title: Strings.privacyAndPolicy,
        url: AppConfig.policyLink,
      ),
    ),

    //about us
    GetPage(
      name: Routes.aboutUs,
      page: () => WebPaymentScreen(
        title: Strings.aboutUs,
        url: AppConfig.aboutUsLink,
      ),
    ),
  ];
}
