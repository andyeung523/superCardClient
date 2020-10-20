//stage2
import 'package:flutter/material.dart';
import 'package:super_card_client/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

class cash_back extends StatefulWidget {
  @override
  _cash_backState createState() => _cash_backState();
}

class _cash_backState extends State<cash_back> {
  int initDollar = UserData.dollar;
  int posDollar = 1;
  int posDollar2show = 1;
  void _updateLabels(int toChange, int end, int asd) {
    setState(() {
      posDollar = toChange;
      // outBedTime = end;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              Center(
                  child: Text(
                posDollar.toString(),
                style: TextStyle(fontSize: 40, color: Colors.black87),
              )),
              SingleCircularSlider(
                300,
                (posDollar * UserData.dollar / 300) as int,
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: []),
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
    );
  }
}
