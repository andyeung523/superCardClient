import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:super_card_client/constants.dart';

class PayPopUp extends StatefulWidget {
  PayPopUp({Key key, this.price}) : super(key: key);
  final int price;
  @override
  _PayPopUpState createState() => _PayPopUpState();
}

class _PayPopUpState extends State<PayPopUp> {
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
            padding: EdgeInsets.all(8.0),
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
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Premium Outstanding',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '\$' + widget.price.toString(),
                        style: TextStyle(
                            color: showHD
                                ? Colors.black
                                : Constants.kPrimaryColor),
                      ),
                    ],
                  ),
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
                              '(Health Dollar) x 5% = ' +
                              (UserData.dollar > widget.price / 0.05
                                      ? widget.price
                                      : UserData.dollar * 0.05)
                                  .toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  if (showHD)
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Constants.kSecondaryColor,
                        ))
                      ],
                    ),
                  if (showHD)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$' +
                              (UserData.dollar > widget.price / 0.05
                                      ? 0
                                      : widget.price - UserData.dollar * 0.05)
                                  .toString(),
                          style: TextStyle(color: Constants.kPrimaryColor),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 100,
                            child: RaisedButton(
                              onPressed: () {
                                setState(() => {showHD = true});
                              },
                              child: Text('Health Dollar',
                                  style: TextStyle(fontSize: 11)),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 100,
                            child: RaisedButton(
                              onPressed: () {
                                setState(() => {showHD = false});
                              },
                              child: Text('Cash'),
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
                          color: Constants.kPrimaryColor,
                          onPressed: () {
                            updateHD(UserData.dollar > widget.price / 0.05
                                ? widget.price / 0.05
                                : UserData.dollar);
                            setState(() => {});
                            Navigator.of(context).pop();
                          },
                          child: Text('PAY'),
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
            {UserData.dollar = (UserData.dollar - hd)}
          }
      };
}
