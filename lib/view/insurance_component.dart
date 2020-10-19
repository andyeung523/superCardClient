import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:super_card_client/bloc/insurace_bloc/ins_bloc.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/data/insurance.dart';
import 'package:super_card_client/view/account_page.dart';
import 'package:super_card_client/view/insurance_page.dart';
import 'package:super_card_client/view/home_page.dart';
import 'package:super_card_client/view/explore_page.dart';
import 'package:google_fonts/google_fonts.dart';

class InsuranceSubedCard extends StatefulWidget {
  InsuranceSubedCard({Key key, this.data}) : super(key: key);

  final Insurance data;

  @override
  _InsuranceSubedCardState createState() => _InsuranceSubedCardState();
}

class _InsuranceSubedCardState extends State<InsuranceSubedCard> {
  bool showHD = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Constants.kLargePadding,
          Constants.kLargePadding, Constants.kLargePadding, 0),
      padding: EdgeInsets.all(Constants.kDefaultPadding),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.green[200]],
            //center: Alignment.centerLeft,
            //radius: .98
          ),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.data.name,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent[250],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Due date: ' + widget.data.dueDate,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Price: ' + widget.data.price.toString(),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: RaisedButton(
                    color: Constants.kPrimaryColor,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PayPopUp(price: widget.data.price);
                          });
                    },
                    child: const Text('PAY',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class InsuranceNoSubedCard extends StatefulWidget {
  InsuranceNoSubedCard({Key key, this.data}) : super(key: key);

  final Insurance data;
  @override
  _InsuranceNoSubedCardState createState() => _InsuranceNoSubedCardState();
}

class _InsuranceNoSubedCardState extends State<InsuranceNoSubedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text(widget.data.name),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                    ' Detail: ' + widget.data.des,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Colors.teal[100],
              onPressed: () => toggleSub(context, widget.data.id),
              child: const Text('Subscribe', style: TextStyle(fontSize: 17)),
            )
          ],
        ),
      ),
    );
  }

  void toggleSub(BuildContext context, int iid) {
    BlocProvider.of<InsuranceBloc>(context).add(ToggleSub(iid));
  }
}

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
        {UserData.dollar = (UserData.dollar - hd)}
      };
}
