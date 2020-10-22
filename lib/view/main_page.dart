import 'package:flutter/material.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/view/account_page.dart';
import 'package:super_card_client/view/insurance_page.dart';
import 'package:super_card_client/view/home_page.dart';
import 'package:super_card_client/view/explore_page.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// This is the main application widget.
class MainPage extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // Define the default brightness and colors.
          scaffoldBackgroundColor: Constants.kBackgroundColor,
          primaryColor: Constants.kPrimaryColor,
          accentColor: Constants.kSecondaryColor,
          textTheme: TextTheme(
              bodyText1: TextStyle(color: Constants.kTextColor),
              bodyText2: TextStyle(color: Constants.kTextColor, fontSize: 18),
              headline5: TextStyle(color: Constants.kTextColor),
              headline4: TextStyle(color: Constants.kTextColor),
              headline6: TextStyle(color: Constants.kTextColor),
              caption: TextStyle(color: Constants.kTextColor, fontSize: 15),
              subtitle1: TextStyle(color: Colors.white),
              subtitle2: TextStyle(
                  color: Constants.kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              button:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              headline1: TextStyle(
                  fontSize: 23,
                  color: Constants.kTextColor,
                  fontWeight: FontWeight.bold))),
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    // Hero(tag: '', child: null),
    HomePage(),
    InsurancePage(),
    ExplorePage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.home,
              size: 35.0,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.textBoxCheckOutline,
              size: 35.0,
            ),
            title: Text('Insurance'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.compass,
              size: 35.0,
            ),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.account,
              size: 35.0,
            ),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Constants.kBackgroundColor,
        unselectedItemColor: Constants.kPrimaryColor,
        selectedItemColor: Constants.kSecondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
