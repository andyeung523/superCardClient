import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:super_card_client/constants.dart';
import 'package:super_card_client/view/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'testing',
      theme: ThemeData(
        primaryColor: Constants.kPrimaryColor,
        scaffoldBackgroundColor: Constants.kBackgroundColor,
        textTheme:
            Theme.of(context).textTheme.apply(bodyColor: Constants.kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
