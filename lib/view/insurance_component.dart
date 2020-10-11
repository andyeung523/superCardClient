import 'package:flutter/material.dart';
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
          Text(
            widget.data.name,
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
            ),
          ),
          Text(widget.data.dueDate),
          Text(widget.data.price.toString()),
        ],
      ),
    );
  }
}
