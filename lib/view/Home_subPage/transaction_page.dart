import 'package:flutter/material.dart';
import 'package:super_card_client/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui' as ui;

class transaction extends StatefulWidget {
  @override
  _transactionState createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Transaction History", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(children: [
        Container(
            //color: Colors.amber,
            child: Column(children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                MdiIcons.heartCircleOutline,
                size: 40,
                color: Constants.kPrimaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("PT Training"),
                    Text("PT d"),
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("- 700 HKD"),
                    Container(
                      color: Constants.kPrimaryColor,
                      child: Text("+ 70 HD"),
                    )
                  ],
                ),
              ),
            ],
          )
        ])),
        RawMaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ]),
    );
  }
}
