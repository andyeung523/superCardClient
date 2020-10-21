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
import 'package:super_card_client/view/insurance_subPage/pay_page.dart';
import 'package:super_card_client/view/insurance_subPage/subscribe_page.dart';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text("Claim",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.transparent)),
                          ),
                        ],
                      )
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
              color: Constants.kPrimaryColor,
              //onPressed: () => toggleSub(context, widget.data.id),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => subPopUp(data: widget.data)),
                );
              },
              child: Text('Detail',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
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
