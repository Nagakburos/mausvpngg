import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../views/drawer/drawer_menu_items.dart';


class CustomDrawerController extends GetxController {
  var currentItem = MenuItems.currentLocation;

  onSelectedItem(item) {
    currentItem = item;
    update();
  }

  getScreen() {
    switch (currentItem) {
      case MenuItems.currentLocation:
        return Routes.ipAddressScreen;

      case MenuItems.aboutUs:
        return Routes.aboutUs;

      case MenuItems.policy:
        return Routes.privacyPolicy;

      case MenuItems.settings:
        return Routes.settingsScreen;
    }
    return null;
  }
}
