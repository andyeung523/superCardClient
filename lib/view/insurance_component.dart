import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Constants.kLargePadding,
          Constants.kLargePadding, Constants.kLargePadding, 0),
      padding: EdgeInsets.all(Constants.kDefaultPadding),
      decoration: BoxDecoration(
          color: Constants.kPrimaryColor,
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
                      Text(
                        widget.data.name,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Due date: ' + widget.data.dueDate,
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),
                      Text(
                        ' Price: ' + widget.data.price.toString(),
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: RaisedButton(
                    color: Colors.teal[100],
                    onPressed: () {},
                    child: const Text('PAY', style: TextStyle(fontSize: 20)),
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
