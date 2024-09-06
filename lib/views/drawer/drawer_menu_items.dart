import 'package:flutter/material.dart';

import '../../models/menu_item_model.dart';
import '../../utils/strings.dart';

class MenuItems {
  // static const MenuItemModel upgrade =  MenuItemModel(
  //   Strings.upgradeToPremium,
  //   "upgrade",
  // );

  static const MenuItemModel currentLocation =  MenuItemModel(
    Strings.currentLocation,
    Icons.pin_drop_rounded,
  );

  static const MenuItemModel aboutUs =  MenuItemModel(
    Strings.aboutUs,
    Icons.info_outline_rounded,
  );

  static const MenuItemModel policy =  MenuItemModel(
    Strings.privacyAndPolicy,
    Icons.shield_outlined,
  );
  static const MenuItemModel settings =  MenuItemModel(
    Strings.settings,
    Icons.settings_outlined,
  );
  // static const MenuItemModel logout =  MenuItemModel(
  //   Strings.logout,
  //   "logout",
  // );

  static List<MenuItemModel> all = <MenuItemModel>[
    // upgrade,
    // myAccount,
    currentLocation,
    aboutUs,
    policy,
    settings,
    // logout,
  ];
}
