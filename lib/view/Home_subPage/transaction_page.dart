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
            // color: Colors.amber,
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "PT Training",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "10-09-2020  17:53",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: 110,
                // color: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        "- 700 HKD",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Constants.kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        color: Constants.kPrimaryColor,
                      ),
                      // width: 55,
                      // height: 20,
                      // color: Constants.kPrimaryColor,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+ 70",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              MdiIcons.heartCircleOutline,
                              // size: 40,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ])),
        Container(
            // color: Colors.amber,
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Dim Dim Green",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "09-09-2020  10:26",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: 110,
                // color: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        "- 480 HKD",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Constants.kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        color: Constants.kPrimaryColor,
                      ),
                      // width: 55,
                      // height: 20,
                      // color: Constants.kPrimaryColor,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+ 48",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              MdiIcons.heartCircleOutline,
                              // size: 40,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
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
