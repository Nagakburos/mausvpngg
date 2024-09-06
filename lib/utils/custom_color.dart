import 'package:flutter/material.dart';

import '../helper/theme_helper.dart';



bool isDark = DarkHelper.isDark();

class CustomColor {
  static  Color bgGradietStartColor =  const Color(0xFF000000);
  static const Color bgGradietEndColor = Color(0xFF707070); // color change theme white
  static  Color primaryColor =  const Color(0xFF707070);
  static const Color progressbarColor = Color(0xFF10FA00);

  static const Color white = Colors.white;
  static const Color black = Colors.black;// color theme aba menu White

  static  Color primaryTextColor = isDark ? Colors.white : Colors.black;

  
  static const Color secondaryColor = Color(0xFF707070);
  static const Color dialogueBGColor = Color(0xFF000000);
  static const Color bottomNavBgColor = Color(0xFF138B00);
  static const Color bottomNavUnselectedColor = Color(0xFF146B00);
  static const Color packageCardBgColor = Color(0xFFECD703);
  static const Color packageCardSideColor = Color(0xFFFFFFFF); // letrasaba de menu
  static const Color renewButtonColor = Color(0xFFFF3600);
  static const Color drawerBgColor = Color(0xFFD1AFFF);
  static const Color onlineColor = Color(0xFF00FF11);



  static const Color greenColor = Colors.green;
  static const Color redColor = Colors.red;



}
