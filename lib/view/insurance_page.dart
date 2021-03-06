import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:super_card_client/bloc/insurace_bloc/ins_bloc.dart';
import 'package:super_card_client/constants.dart';
import 'package:super_card_client/data/insurance.dart';

import 'insurance_component.dart';

class InsurancePage extends StatefulWidget {
  InsurancePage({Key key}) : super(key: key);

  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    refreshList(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Insurance',
          // style: Theme.of(context).textTheme.subtitle1,
          // textScaleFactor: 1.3,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Constants.kPrimaryColor,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Container(
              child: Text(
                'My insurance',
                style: Theme.of(context).textTheme.headline4,
                textScaleFactor: 0.8,
              ),
            ),
            BlocConsumer<InsuranceBloc, InsuranceState>(
              listener: (context, state) {
                if (state is InsuraceError)
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
              },
              builder: (context, state) {
                if (state is InsuranceInitial) return buildInitial(context);
                if (state is InsuranceLoading) return buildLoading();
                if (state is InsuraceLoaded)
                  return subedBuildLoaded(state.list[0]);
                else
                  return buildInitial(context);
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                'Insurance list',
                style: Theme.of(context).textTheme.headline4,
                textScaleFactor: 0.8,
              ),
            ),
            BlocConsumer<InsuranceBloc, InsuranceState>(
              listener: (context, state) {
                if (state is InsuraceError)
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
              },
              builder: (context, state) {
                if (state is InsuranceInitial) return buildInitial(context);
                if (state is InsuranceLoading) return buildLoading();
                if (state is InsuraceLoaded)
                  return noSubedBuildLoaded(state.list[1]);
                else
                  return buildInitial(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInitial(BuildContext context) {
    return Center(
        child: Container(
            height: 200,
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Could not load insurance.\nPlease try again.",
                textAlign: TextAlign.center,
              ),
              FlatButton(
                  color: Constants.kPrimaryColor,
                  onPressed: () => refreshList(context),
                  child: Text("Reload", style: TextStyle(color: Colors.white)))
            ])));
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());

  Widget subedBuildLoaded(List<Insurance> list) => ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (ctx, i) =>
            InsuranceSubedCard(data: list[i], globalKey: globalKey),
      );

  void refreshList(BuildContext context) {
    BlocProvider.of<InsuranceBloc>(context).add(RefreashInsurace());
  }

  Widget noSubedBuildLoaded(List<Insurance> list) => ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (ctx, i) => InsuranceNoSubedCard(data: list[i]),
      );
}
