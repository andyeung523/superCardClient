import 'package:flutter/material.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/data/insurance.dart';
import 'package:super_card_client/view/account_page.dart';
import 'package:super_card_client/view/insurance_page.dart';
import 'package:super_card_client/view/home_page.dart';
import 'package:super_card_client/view/explore_page.dart';

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
      child: Container(
        child: Text('test'),
      ),
    );
  }
}
