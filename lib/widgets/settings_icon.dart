import 'package:flutter/material.dart';

class SettingIcon extends StatelessWidget {
  final Icon icon;
  final VoidCallback onSelect;
  final Text text;

  SettingIcon({this.icon,this.text, @required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onSelect,
    );
  }
}
