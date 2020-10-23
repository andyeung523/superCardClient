import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:super_card_client/bloc/insurace_bloc/ins_bloc.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/data/insurance.dart';
import 'package:super_card_client/view/main_page.dart';

class subPopUp extends StatefulWidget {
  subPopUp({
    Key key,
    this.data,
  }) : super(key: key);
  Insurance data;

  @override
  _subPopUpState createState() => _subPopUpState();
}

class _subPopUpState extends State<subPopUp> {
  _getRequests() async {}
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
                    'Details',
                    style: TextStyle(
                        color: Constants.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
                ]),
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      widget.data.des,
                      style: Theme.of(context).textTheme.caption,
                    ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                        child: Text(
                          '*Contact our Customer Service for more',
                          style: Theme.of(context).textTheme.caption,
                          textScaleFactor: 0.8,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Flexible(
                //         child: Table(
                //           defaultColumnWidth: FixedColumnWidth(100.0),
                //           border: TableBorder.all(
                //               color: Colors.black87,
                //               width: 2.0,
                //               style: BorderStyle.solid),
                //           children: [
                //             TableRow(children: [
                //               Column(children: [Text('text 1')]),
                //               Column(children: [Text('text 1')]),
                //               Column(children: [Text('text 1')]),
                //             ]),
                //             TableRow(children: [
                //               Column(children: [Text('text 2')]),
                //               Column(children: [Text('text 2')]),
                //               Column(children: [Text('text 2')]),
                //             ])
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Row(
                  children: [
                    Flexible(
                        child: Text(
                      'Coverage',
                      style: TextStyle(
                          color: Constants.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
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
                      child: Text(
                        '\$500,000',
                        style: Theme.of(context).textTheme.button,
                        textScaleFactor: 1.2,
                      ),
                    ),
                    RaisedButton(
                      color:
                          isLeft ? Colors.green[100] : Constants.kPrimaryColor,
                      onPressed: () {
                        setState(() => {isLeft = false});
                      },
                      child: Text(
                        '\$1,000,000',
                        style: Theme.of(context).textTheme.button,
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              color: Constants.kSecondaryColor,
              onPressed: () => showAlertDialog(context, widget.data.id),
              child: Text(
                'Apply Now',
                style: Theme.of(context).textTheme.button,
                textScaleFactor: 1.2,
              ),
            ),
          ),
        ));
  }

  void toggleSub(BuildContext context, int iid) {
    BlocProvider.of<InsuranceBloc>(context).add(ToggleSub(iid));
    //Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  showAlertDialog(BuildContext context, int idd) {
    final snackBar = SnackBar(
        backgroundColor: Constants.kPrimaryColor,
        content: Text('Apply success!', style: TextStyle(fontSize: 20)));
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No", style: Theme.of(context).textTheme.subtitle2),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes", style: Theme.of(context).textTheme.subtitle2),
      onPressed: () {
        Scaffold.of(context).showSnackBar(snackBar);
        Navigator.of(context, rootNavigator: true).pop();
        toggleSub(context, idd);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Confirmation of application",
        style: Theme.of(context).textTheme.headline5,
        textScaleFactor: 0.8,
      ),
      content: Text("Are you sure to apply?",
          style: Theme.of(context).textTheme.caption),
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
//stage1
