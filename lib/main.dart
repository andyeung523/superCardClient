import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_card_client/bloc/insurace_bloc/ins_bloc.dart';
import 'package:super_card_client/view/account_page.dart';
import 'package:super_card_client/view/insurance_page.dart';
import 'package:super_card_client/view/home_page.dart';
import 'package:super_card_client/view/explore_page.dart';
import 'package:flutter/services.dart';
import 'package:super_card_client/view/main_page.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/view/LoginScreen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Constants.kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: BlocProvider(
              create: (context) => InsuranceBloc(), child: MainPage()),
        ));
  }
}
