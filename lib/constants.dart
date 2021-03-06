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
  static const kBackgroundColor = Color(0xffF5FAF3);
  static const kTextColor = Color(0xff413D39);
  static const kLinearColor =
      LinearGradient(colors: [kPrimaryColor, kSecondaryColor]);
  static const kDefaultPadding = 16.0;
  static const kLargePadding = 32.0;
  static const kSmallPadding = 12.0;
  static const cashBackRate = 0.01;
  static const insTranRate = 0.05;
}

class UserData {
  static int dollar = 5132;
  static double accountBalance = 11500;
}
