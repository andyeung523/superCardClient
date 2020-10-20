import 'package:flutter/material.dart';

const IS_DEBUG = true;
void log(Object object) {
  if (!IS_DEBUG) return;
  print(object);
}

class Constants {
  static const String appName = 'SuperCard';
  static const String logoTag = '';
  static const String titleTag = '';
  static const kPrimaryColor = Color(0xff51af47);
  static const kSecondaryColor = Color(0xff147f18);
  static const kBackgroundColor = Color(0xffffffff);
  static const kTextColor = Color(0x0000000);
  static const kLinearColor =
      LinearGradient(colors: [kPrimaryColor, kSecondaryColor]);
  static const kDefaultPadding = 16.0;
  static const kLargePadding = 32.0;
  static const kSmallPadding = 12.0;
}

class UserData {
  static int dollar = 500;
  static int accountBalance = 11500;
}
