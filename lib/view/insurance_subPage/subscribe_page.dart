import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:super_card_client/bloc/insurace_bloc/ins_bloc.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/data/insurance.dart';

class subPopUp extends StatefulWidget {
  subPopUp({Key key, this.data}) : super(key: key);
  Insurance data;
  @override
  _subPopUpState createState() => _subPopUpState();
}

class _subPopUpState extends State<subPopUp> {
  bool isLeft = true;
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.data.name,
            style: TextStyle(color: Constants.kPrimaryColor),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(children: [
                  Flexible(
                      child: Text(
                    'Detail',
                    style: TextStyle(
                        color: Constants.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
                ]),
                Row(
                  children: [Flexible(child: Text(widget.data.des))],
                ),
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      'Sum Insuranced',
                      style: TextStyle(
                          color: Constants.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color:
                          isLeft ? Constants.kPrimaryColor : Colors.green[100],
                      onPressed: () {
                        setState(() => {isLeft = true});
                      },
                      child: Text('\$50 ,000',
                          style: TextStyle(
                              color: isLeft ? Colors.white : Colors.black,
                              fontSize: 17)),
                    ),
                    RaisedButton(
                      color:
                          isLeft ? Colors.green[100] : Constants.kPrimaryColor,
                      onPressed: () {
                        setState(() => {isLeft = false});
                      },
                      child: Text('\$100 ,000',
                          style: TextStyle(
                              color: isLeft ? Colors.black : Colors.white,
                              fontSize: 17)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              color: Constants.kSecondaryColor,
              onPressed: () => toggleSub(context, widget.data.id),
              child: Text('Apply Now',
                  style: TextStyle(fontSize: 17, color: Colors.white)),
            ),
          ),
        ));
  }

  void toggleSub(BuildContext context, int iid) {
    BlocProvider.of<InsuranceBloc>(context).add(ToggleSub(iid));
    Navigator.of(context).pop();
  }
}
//stage1
