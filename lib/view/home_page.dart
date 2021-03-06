import 'package:flutter/material.dart';
import 'package:super_card_client/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:super_card_client/view/Home_subPage/cash_back.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'package:super_card_client/view/Home_subPage/transaction_page.dart';
//import 'package:flutter;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cardNo = 'XXXX-XXXX-XXXX-XXXX';
  var cardNoState = 0;

  var accountBalanceState = 0;
  var accountBalance = "******";

  var expDate = 'XX/XX';
  var cvv = 'XXX';
  var displayIcon = Icon(MdiIcons.eye);
  var displayIcon2 = Icon(MdiIcons.eye);

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
      if (authenticated) {
        displayCardno();
      }
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  void displayCardno() {
    setState(() {
      if (cardNoState == 0) {
        cardNo = '1234-5678-1234-5678';
        displayIcon = Icon(MdiIcons.eye);
        expDate = '10/25';
        cvv = '430';
        cardNoState = 1;
      } else {
        cardNo = 'XXXX-XXXX-XXXX-XXXX';
        displayIcon = Icon(MdiIcons.eyeOff);
        expDate = 'XX/XX';
        cvv = 'XXX';
        cardNoState = 0;
      }
    });
  }

  void displayAccountBalance() {
    setState(() {
      if (accountBalanceState == 0) {
        displayIcon2 = Icon(MdiIcons.eye);
        accountBalance = UserData.accountBalance.toString();

        accountBalanceState = 1;
      } else {
        accountBalance = "******";
        displayIcon2 = Icon(MdiIcons.eyeOff);

        accountBalanceState = 0;
      }
    });
  }

  Future<void> goAuthtication() {
    if (cardNoState == 0) {
      _isAuthenticating ? _cancelAuthentication() : _authenticate();
    } else {
      displayCardno();
    }
  }

  @override
  Widget build(BuildContext context) {
    String greeting = DateTime.now().hour > 17
        ? 'Good evening'
        : DateTime.now().hour > 12
            ? 'Good morning'
            : 'Good afternoon';
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Icon(
              MdiIcons.faceAgent,
              color: Constants.kPrimaryColor,
              size: 30.0,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //color: Colors.grey,
          child: Text(
            '$greeting, Joey!',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Image.asset('assets/images/card_img.png'),
                Positioned(
                  right: 20.0,
                  bottom: 100.0,
                  child: IconButton(
                    icon: displayIcon,
                    onPressed: goAuthtication,
                    highlightColor: null,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 90.0,
                  left: 15.0,
                  child: Row(
                    children: [
                      Text(cardNo,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      IconButton(
                        icon: Icon(
                          MdiIcons.contentCopy,
                          color: Colors.white,
                          size: 21.0,
                        ),
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: "1234-5678-1234-5678"));
                        },
                        highlightColor: null,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 15.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "VALID THRU",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(expDate,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CVV",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                          Text(cvv,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // SizedBox(height: 5),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          // color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Account Balance',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.left,
                  ),
                  // SizedBox(width: 10),
                  IconButton(
                    icon: displayIcon2,
                    onPressed: displayAccountBalance,
                    color: Colors.black,
                    // highlightColor: Colors.white,
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  text: 'HKD ',
                  style: Theme.of(context).textTheme.caption,
                  children: <InlineSpan>[
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      // baseline: TextBaseline.alphabetic,
                      child: Text(
                        accountBalance,
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Health Dollar',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Icon(
                    MdiIcons.heartCircleOutline,
                    size: 50,
                    color: Constants.kPrimaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    UserData.dollar.toString(),
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => cash_back()),
                      );
                    },
                    elevation: 2.0,
                    fillColor: Constants.kPrimaryColor,
                    // child: Icon(
                    //   MdiIcons.currencyUsdCircleOutline,
                    //   color: Colors.white,
                    //   size: 35.0,
                    // ),
                    child: Text(
                      "Cash Back",
                      style: Theme.of(context).textTheme.button,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Center(
          child: Container(
            //color: Colors.amber,
            //alignment: Alignment.center,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //color: Colors.blueGrey,
                    child: Column(
                      children: [
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Constants.kPrimaryColor,
                          child: Icon(
                            MdiIcons.plus,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                          splashColor: Colors.black,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Add Money",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Constants.kPrimaryColor,
                        child: Icon(
                          MdiIcons.swapHorizontal,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                        splashColor: Colors.black,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Transfer",
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Constants.kPrimaryColor,
                          child: Icon(
                            MdiIcons.currencyUsdCircleOutline,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                          splashColor: Colors.black,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Loan",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => transaction()),
                            );
                          },
                          elevation: 2.0,
                          fillColor: Constants.kPrimaryColor,
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                          splashColor: Colors.black,
                          //highlightColor: Colors.green[200],
                        ),
                        SizedBox(height: 5),
                        Text(
                          "History",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ]),
    ));
  }
}
