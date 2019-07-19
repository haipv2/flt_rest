import 'package:flutter/material.dart';

class Tips {
  Widget child;
  String title;
  String desc;
  Widget extraWidget;

  Tips({this.child, this.title, this.desc, this.extraWidget}) {
    if (extraWidget == null) {
      extraWidget = new Container();
    }
  }
}
