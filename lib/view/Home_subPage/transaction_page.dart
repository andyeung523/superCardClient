import 'package:flutter/material.dart';
import 'package:super_card_client/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class transaction extends StatefulWidget {
  @override
  _transactionState createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Transaction History", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
                // top: BorderSide(width: 1.0, color: Colors.grey),
                // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                bottom: BorderSide(
              width: 1.0,
              color: Colors.grey,
            )),
          ),
          // color: Colors.grey,
          child: Row(
            children: [
              Expanded(
                child: Row(children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "09/2020",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ]),
              )
            ],
          ),
          // color: Colors.grey,
        ),
        Container(
            decoration: const BoxDecoration(
              border: Border(
                  // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                  bottom: BorderSide(
                width: 1.0,
                color: Colors.grey,
              )),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
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
                            style: TextStyle(fontSize: 16),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
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
            decoration: const BoxDecoration(
              border: Border(
                  // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                  bottom: BorderSide(
                width: 1.0,
                color: Colors.grey,
              )),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
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
                            style: TextStyle(fontSize: 16),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
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
            decoration: const BoxDecoration(
              border: Border(
                  // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                  bottom: BorderSide(
                width: 1.0,
                color: Colors.grey,
              )),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
            // color: Colors.amber,
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.cartOutline,
                    size: 40,
                    color: Colors.amber,
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
                          "Parknshop",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "07-09-2020  16:01",
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
                            "- 230 HKD",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ])),
        Container(
            decoration: const BoxDecoration(
              border: Border(
                  // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                  bottom: BorderSide(
                width: 1.0,
                color: Colors.grey,
              )),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
            // color: Colors.amber,
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.currencyUsd,
                    size: 40,
                    color: Colors.red[200],
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
                          "Inward Fund Transfer",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "03-09-2020  12:31",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: 120,
                    // color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "+ 1,000 HKD",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ])),
        Container(
          // new 08
          decoration: const BoxDecoration(
            border: Border(
                // top: BorderSide(width: 1.0, color: Colors.grey),
                // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                bottom: BorderSide(
              width: 1.0,
              color: Colors.grey,
            )),
          ),
          // color: Colors.green,
          child: Row(
            children: [
              Expanded(
                child: Row(children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "08/2020",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ]),
              )
            ],
          ),
          // color: Colors.grey,
        ),
        Container(
            decoration: const BoxDecoration(
              border: Border(
                  // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                  bottom: BorderSide(
                width: 1.0,
                color: Colors.grey,
              )),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
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
                          "Noke",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "24-08-2020  18:35",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                            "- 630 HKD",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
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
                                  "+ 63",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
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
            decoration: const BoxDecoration(
              border: Border(
                  // top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
                  // right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                  bottom: BorderSide(
                width: 1.0,
                color: Colors.grey,
              )),
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
            // color: Colors.amber,
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.currencyUsd,
                    size: 40,
                    color: Colors.red[200],
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
                          "Inward Fund Transfer",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "19-08-2020  11:42",
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
                            "+ 500 HKD",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ])),
        // RawMaterialButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text('Go back!'),
        // ),
      ]),
    );
  }
}
