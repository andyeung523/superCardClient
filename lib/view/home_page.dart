import 'package:flutter/material.dart';
import 'package:super_card_client/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui' as ui;

import 'package:super_card_client/view/Home_subPage/transaction_page.dart';
//import 'package:flutter;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Icon(
            MdiIcons.faceAgent,
            color: Constants.kPrimaryColor,
            size: 30.0,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          //color: Colors.grey,
          child: Text(
            'Hi, Cyber Youngsters',
            style: TextStyle(fontSize: 30, color: Colors.black),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
            constraints:
                BoxConstraints.tightFor(width: 370.0, height: 226), //卡片大小
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                //背景装饰
                gradient: LinearGradient(
                  //背景径向渐变
                  colors: [Colors.green, Colors.green[300]],
                  //center: Alignment.centerLeft,
                  //radius: .98
                ),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
          ),
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          // color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Balance',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left,
              ),
              Text(
                'HKD 11,500',
                style: TextStyle(fontSize: 30, color: Colors.black),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                'Health Dollar',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Icon(
                    MdiIcons.heartCircleOutline,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '500',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Constants.kPrimaryColor,
                    // child: Icon(
                    //   MdiIcons.currencyUsdCircleOutline,
                    //   color: Colors.white,
                    //   size: 35.0,
                    // ),
                    child: Text(
                      "Cash Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
          height: 15,
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
                        Text("Add Money"),
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
                      Text("Transfer")
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
                        Text("Loan")
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
                        Text("Transaction")
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
