import 'package:flutter/cupertino.dart';

class main_page extends StatefulWidget {
  main_page({Key key}) : super(key: key);

  @override
  _main_pageState createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Container(
        child: Text("CounterPage"),
      ),
    ));
  }
}
