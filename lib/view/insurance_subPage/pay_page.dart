import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/view/main_page.dart';
import 'dart:developer';

class PayPopUp extends StatefulWidget {
  PayPopUp({Key key, this.price, this.globalKey}) : super(key: key);
  final int price;
  GlobalKey<ScaffoldState> globalKey;
  @override
  _PayPopUpState createState() => _PayPopUpState();
}

class _PayPopUpState extends State<PayPopUp> {
  _getRequests() async {}
  bool showHD = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Stack(overflow: Overflow.visible, children: <Widget>[
      Positioned(
        right: -40.0,
        top: -40.0,
        child: InkResponse(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            child: Icon(Icons.close),
            backgroundColor: Colors.red,
          ),
        ),
      ),
      FractionallySizedBox(
        heightFactor: 0.4,
        child: Center(
          child: Container(
            //padding: EdgeInsets.all(8.0),
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.heartCircleOutline,
                        size: 30,
                        color: Constants.kPrimaryColor,
                      ),
                      Text(
                        UserData.dollar.toString(),
                        style: TextStyle(
                          color: Constants.kPrimaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Premium Outstanding',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  if (showHD)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$' + widget.price.toString() + ".0",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  else
                    (Row(
                      children: [Text(" ")],
                    )),
                  if (showHD)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '-' +
                              (UserData.dollar > widget.price / 0.05
                                      ? widget.price / 0.05
                                      : UserData.dollar)
                                  .toString() +
                              '(Health Dollar) x 5% = \$' +
                              (UserData.dollar > widget.price / 0.05
                                      ? widget.price
                                      : (UserData.dollar * 0.05)
                                          .roundToDouble())
                                  .toString(),
                          style: TextStyle(
                            color: Constants.kTextColor,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  else
                    Row(children: [Text('     ')]),
                  if (showHD)
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Constants.kSecondaryColor,
                        ))
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                        ))
                      ],
                    ),
                  if (showHD)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'HKD \$' +
                              (UserData.dollar > widget.price / 0.05
                                      ? 0
                                      : widget.price - UserData.dollar * 0.05)
                                  .toString(),
                          style: TextStyle(
                            color: Constants.kPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  else
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text('HKD \$' + widget.price.toString() + ".0",
                          style: TextStyle(
                            fontSize: 20,
                            color: Constants.kPrimaryColor,
                          ))
                    ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 100,
                            child: RaisedButton(
                              color: showHD
                                  ? Constants.kPrimaryColor
                                  : Colors.green[100],
                              onPressed: () {
                                setState(() => {showHD = true});
                              },
                              child: Icon(
                                MdiIcons.heartCircleOutline,
                                size: 30,
                                color: showHD
                                    ? Colors.white
                                    : Colors.green[400], // Constants
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 100,
                            child: RaisedButton(
                              color: !showHD
                                  ? Constants.kPrimaryColor
                                  : Colors.green[100],
                              onPressed: () {
                                setState(() => {showHD = false});
                              },
                              child: Text('Cash',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: !showHD
                                          ? Colors.white
                                          : Colors.green[
                                              400] //onstants.kPrimaryColor,
                                      )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: RaisedButton(
                          color: Constants.kSecondaryColor,
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: Text('PAY',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]));
  }

  void updateHD(int hd) => {
        if (showHD)
          {
            {
              UserData.dollar = (UserData.dollar - hd),
              UserData.accountBalance -= (widget.price - hd * 0.05).round(),
            }
          }
        else
          {
            {UserData.accountBalance = (UserData.accountBalance - widget.price)}
          }
      };

  showAlertDialog(BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: Constants.kPrimaryColor,
        content: Text('Payment success!', style: TextStyle(fontSize: 20)));
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "No",
        style: TextStyle(
            color: Constants.kPrimaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Yes",
        style: TextStyle(
            color: Constants.kPrimaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 20),
      ),
      onPressed: () {
        updateHD(UserData.dollar > widget.price / 0.05
            ? widget.price / 0.05
            : UserData.dollar);
        setState(() => {});
        widget.globalKey.currentState.showSnackBar(snackBar);
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation of payment",
          style: TextStyle(color: Constants.kTextColor)),
      content: Text("Are you sure to pay?",
          style: TextStyle(color: Constants.kTextColor)),
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
}
