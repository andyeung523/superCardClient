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
  int posDollar = UserData.dollar;
  int tranValue = (UserData.dollar * 0.05).round();
  void _updateLabels(int asdd, int toChange, int asd) {
    setState(() {
      //posDollar = (asd / UserData.dollar * 300).round();
      posDollar = (toChange / 300 * UserData.dollar).round();
      tranValue = (posDollar * 0.05).round();
      //log('data: $posDollar, $end ,$asd');
      // outBedTime = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getRequests() async {}
    return Scaffold(
      appBar: AppBar(
        title: Text("Cash Back", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(12),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'How many Health Dollar do you want to convert into cash?',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              // ali: Alignment.center,
            ),
          ),
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
                    style: TextStyle(fontSize: 30, color: Colors.black87),
                  )
                ]),
                SingleCircularSlider(
                  300,
                  300,
                  baseColor: Colors.green[200],
                  selectionColor: Constants.kPrimaryColor,
                  handlerColor: Colors.black,
                  showRoundedCapInSelection: false,
                  onSelectionChange: _updateLabels,
                  // onSelectionChange: _updateLabels,
                ),
              ],
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                ' \$' + tranValue.toString(),
                style: TextStyle(color: Constants.kPrimaryColor, fontSize: 20),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
              onPressed: () => {
                UserData.accountBalance += tranValue,
                UserData.dollar -= posDollar,
                Navigator.of(context)
                    .push(
                      new MaterialPageRoute(builder: (_) => new MainPage()),
                    )
                    .then((val) => val ? _getRequests() : null),
              },
              child: Text('Convert!'),
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
          // ],
        ]),
      ),
    );
  }
}
