import 'package:flutter/material.dart';

class School extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SchoolState();
  }
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[Text("School")],
      ),
    );
    ;
  }
}
