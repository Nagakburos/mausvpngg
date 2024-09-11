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
    Icons.location_on,
  );

  static const MenuItemModel2 aboutUs =  MenuItemModel2(
    //Strings.aboutUs,
    //Icons.info_outline,
  );

  static const MenuItemModel policy =  MenuItemModel(
    Strings.privacyAndPolicy,
    Icons.newspaper_rounded,
  );
  static const MenuItemModel2 settings =  MenuItemModel2(
    //Strings.settings,
    //Icons.edit_document,
  );
  // static const MenuItemModel logout =  MenuItemModel(
  //   Strings.logout,
  //   "logout",
  // );

  static List<MenuItemModel> all = <MenuItemModel>[
    // upgrade,
    // myAccount,
    currentLocation,
    policy,
    //aboutUs,
    //settings,
    // logout,
  ];
}
