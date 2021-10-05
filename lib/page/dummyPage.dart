
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dummy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DummyState();
  }
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Text("Hello World"),
      ),
    );
  }
}