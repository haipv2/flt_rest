import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

class ShopBottomBar extends StatefulWidget {
  final Shop shop;
  final int currentTab;
  ShopBottomBar({@required this.shop, this.currentTab: 1});

  @override
  _ShopBottomBarState createState() => _ShopBottomBarState();
}

class _ShopBottomBarState extends State<ShopBottomBar> {
  final String txtMenu = globalBloc.text('txtMenu');
  final String txtBook = globalBloc.text('txtBook');
  final String txtBack = globalBloc.text('txtBack');

  @override
  void initState() {
    super.initState();
  }
  ShopBloc shopBloc;

  @override
  Widget build(BuildContext context) {
    shopBloc = BlocProvider.of<ShopBloc>(context);
    return BottomNavigationBar(
      onTap: _selectBottomMenu,
      currentIndex: widget.currentTab,
      selectedItemColor: Colors.amber[800],
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back_ios),
          title: Text(txtBack),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          title: Text(txtMenu),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          title: Text(txtBook),
        ),
      ],
    );
//    return StreamBuilder(
//        stream: shopBloc.streamBottomBar,
//        initialData: shopBloc.defaultTabBar,
//        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//          return BottomNavigationBar(
//            onTap: _selectBottomMenu,
//            currentIndex: snapshot.data,
//            selectedItemColor: Colors.amber[800],
//            items: <BottomNavigationBarItem>[
//              BottomNavigationBarItem(
//                icon: Icon(Icons.arrow_back_ios),
//                title: Text(txtBack),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.restaurant_menu),
//                title: Text(txtMenu),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.access_time),
//                title: Text(txtBook),
//              ),
//            ],
//          );
//        });
  }

  void _selectBottomMenu(int value) {
    if (value == 0) {
      Navigator.of(context).pop();
    }
    shopBloc.selectTab(value);
  }
}
