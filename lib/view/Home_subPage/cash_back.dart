//stage2
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:super_card_client/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'dart:developer';

import 'package:super_card_client/view/home_page.dart';
import 'package:super_card_client/view/main_page.dart';

class cash_back extends StatefulWidget {
  @override
  _cash_backState createState() => _cash_backState();
}

class _cash_backState extends State<cash_back> {
  int initDollar = UserData.dollar;
  int lap = (UserData.dollar * Constants.cashBackRate).round();
  int posDollar = UserData.dollar;
  double cashBackRate = Constants.cashBackRate;
  int tranValue = (UserData.dollar * Constants.cashBackRate).round();
  void _updateLabels(int asdd, int toChange, int asd) {
    setState(() {
      //posDollar = (asd / UserData.dollar * 300).round();
      posDollar = (toChange / lap * UserData.dollar).round();
      tranValue = (posDollar * Constants.cashBackRate).round();
      //log('data: $posDollar, $end ,$asd');
      // outBedTime = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getRequests() async {}
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text("Cash Back", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.only(left:12,right:12),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          if (UserData.dollar * Constants.cashBackRate >= 1)
            Text(
              'How many Health Dollar do you want to convert into cash?',
                style: Theme.of(context).textTheme.caption,

        // ali: Alignment.center,

            ),
          if (UserData.dollar * Constants.cashBackRate >= 1)
            Center(
              child: Container(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      MdiIcons.heartCircleOutline,
                      size: 50,
                      color: Constants.kPrimaryColor,
                    ),
                    Text(
                      posDollar.toString(),
                      style: TextStyle(fontSize: 30, color: Constants.kTextColor),
                    )
                  ]),
                  SingleCircularSlider(
                    lap,
                    lap,
                    baseColor: Colors.green[200],
                    selectionColor: Constants.kPrimaryColor,
                    handlerColor: Constants.kTextColor,
                    showRoundedCapInSelection: false,
                    onSelectionChange: _updateLabels,
                    // onSelectionChange: _updateLabels,
                  )
                ],
              )),
            ),
          if (UserData.dollar * Constants.cashBackRate >= 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.heartCircleOutline,
                  size: 20,
                  color: Constants.kPrimaryColor,
                ),
                Text(
                  '$posDollar x $cashBackRate = \$' + tranValue.toString(),
                  style:
                      TextStyle(color: Constants.kPrimaryColor, fontSize: 25),
                )
              ],
            ),
          if (UserData.dollar * Constants.cashBackRate >= 1)
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              RaisedButton(
                color: Constants.kPrimaryColor,
                onPressed: () => {showAlertDialog(context)},
                child: Text('Convert',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )
            ]),
          // FlatButton(
          //   child: Text('S H U F F L E'),
          //   // color: baseColor,
          //   textColor: Colors.white,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(50.0),
          //   ),
          //   onPressed: ,
          // ),

          if (UserData.dollar * Constants.cashBackRate < 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.emoticonDevilOutline,
                  size: 250,
                  color: Constants.kPrimaryColor,
                ),
              ],
            ),
          if (UserData.dollar * Constants.cashBackRate < 1)
            Row(
              children: [
                Flexible(
                  child: Text(
                    'Oh, you do not have enough Health Dollar, time to shop!',
                    style: TextStyle(
                        fontSize: 20, color: Constants.kSecondaryColor),
                  ),
                )
              ],
            ),
          // ],
        ]),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: Constants.kPrimaryColor,
        content: Text('Convert success!', style: TextStyle(fontSize: 20)));
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No",style: Theme.of(context).textTheme.subtitle2,
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes", style: Theme.of(context).textTheme.subtitle2,
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        UserData.accountBalance += tranValue;
        UserData.dollar -= posDollar;
        Scaffold.of(context).showSnackBar(snackBar);
        Navigator.of(context)
            .push(
              new MaterialPageRoute(builder: (_) => new MainPage()),
            )
            .then((val) => val ? _getRequests() : null);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation of conversion",style: Theme.of(context).textTheme.headline5,
        textScaleFactor: 0.8,
      ),
      content: Text("Are you sure to convert?",style: Theme.of(context).textTheme.caption,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _getRequests() {}
}
