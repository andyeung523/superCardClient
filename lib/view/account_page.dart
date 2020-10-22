import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:super_card_client/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundColor,
//      appBar: AppBar(
//        title: Text('First APP'),
//        backgroundColor: Colors.pink[400],
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  "assets/images/dpb.png",
                  height: 150,
                ),
                Text(
                  'Joey',
                  style: TextStyle(fontSize: 32.0),
                ),

                // Text(
                //   'Flutter Developer',
                //   style: TextStyle(fontSize: 16.0),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: <Widget>[
                //     Column(
                //       children: <Widget>[
                //         CircleAvatar(
                //           backgroundColor: Colors.brown,
                //           radius: 32,
                //           child: Text(
                //             '50',
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10.0,
                //         ),
                //         Text('Followers')
                //       ],
                //     ),
                //     Column(
                //       children: <Widget>[
                //         CircleAvatar(
                //           backgroundColor: Colors.brown,
                //           radius: 32,
                //           child: Text(
                //             '100',
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10.0,
                //         ),
                //         Text('Following')
                //       ],
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 8,
                  width: double.infinity,
                  color: Constants.kPrimaryColor,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.green,
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.currencyUsd,
                              size: 35,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                "FPS & Transfer Setting",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Icon(
                              MdiIcons.chevronRight,
                              size: 40,
                              color: Constants.kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.noteText,
                            size: 35,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "e-Statement Setting",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronRight,
                            size: 40,
                            color: Constants.kPrimaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.security,
                            size: 35,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Password & Security",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronRight,
                            size: 40,
                            color: Constants.kPrimaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.formatText,
                            size: 35,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Language",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronRight,
                            size: 40,
                            color: Constants.kPrimaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.information,
                            size: 35,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "About SuperCard",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Icon(
                            MdiIcons.chevronRight,
                            size: 40,
                            color: Constants.kPrimaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
