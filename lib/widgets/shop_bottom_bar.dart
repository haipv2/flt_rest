import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

class ShopBottomBar extends StatefulWidget {
  final Shop shop;

  ShopBottomBar({@required this.shop});

  @override
  _ShopBottomBarState createState() => _ShopBottomBarState();
}

class _ShopBottomBarState extends State<ShopBottomBar> {
  final String txtMenu = globalBloc.text('txtMenu');
  final String txtBook = globalBloc.text('txtBook');
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _selectBottomMenu,
      selectedItemColor: Colors.amber[800],
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          title: Text(txtMenu),
        ),BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          title: Text(txtBook),
        ),
      ],
    );
  }

  void _selectBottomMenu(int value) {
  }
}
