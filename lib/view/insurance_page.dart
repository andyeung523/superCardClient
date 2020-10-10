import 'package:flutter/material.dart';

class InsurancePage extends StatefulWidget {
  InsurancePage({Key key}) : super(key: key);

  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Insurance',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Text('InsurancePage'),
    );
  }
}
