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
  InsuranceSubedCard({Key key, this.data, this.globalKey}) : super(key: key);

  final Insurance data;
  GlobalKey<ScaffoldState> globalKey;

  @override
  _InsuranceSubedCardState createState() => _InsuranceSubedCardState();
}

class _InsuranceSubedCardState extends State<InsuranceSubedCard> {
  bool showHD = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Constants.kDefaultPadding,
          Constants.kDefaultPadding, Constants.kDefaultPadding, 0),
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
                            style: Theme.of(context).textTheme.button,
                            textScaleFactor: 1.5,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'Status: ' + widget.data.status,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Due date: ' + widget.data.dueDate,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Price: \$' + widget.data.price.toString(),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Coverage: \$500,000',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text("Claim",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.kTextColor)),
                            /*shape: CircleBorder(
                                side: BorderSide(color: Colors.red)),*/
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
                            return PayPopUp(
                                price: widget.data.price,
                                globalKey: widget.globalKey);
                          });
                    },
                    child: Text(
                      'PAY',
                      style: Theme.of(context).textTheme.button,
                    ),
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
    var desList = widget.data.des.split(' ');

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          title: Row(children: [
            Icon(
              MdiIcons.clipboardCheckMultipleOutline,
              color: Constants.kTextColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.data.name,
              style: Theme.of(context).textTheme.headline6,
            )
          ]),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              // padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    (desList.length < 20
                            ? widget.data.des
                            : desList.sublist(0, 20).join(' ')) +
                        (desList.length > 20 ? '...' : ''),
                    style: Theme.of(context).textTheme.caption,
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
              child: Text('Details',
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
