import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/blocs/shop/shop_event.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

import 'drawer_widget.dart';
import 'shop_bottom_bar.dart';

class ShopDetail extends StatefulWidget {
  final Shop shop;

  ShopDetail({@required this.shop});

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  ShopBloc shopBloc;

  @override
  void initState() {
    super.initState();
    shopBloc = new ShopBloc();
    shopBloc.addEvent(ShopEvent(type: ShopEventType.changed));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopBloc>(
      bloc: shopBloc,
      child: StreamBuilder(
          stream: shopBloc.streamBottomBar,
          initialData: shopBloc.defaultTabBar,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: listTab().elementAt(snapshot.data),
              appBar: AppBar(
                title: Text(widget.shop.shopName),
              ),
              drawer: ShopDrawer(),
              bottomNavigationBar: ShopBottomBar(
                shop: widget.shop,
                currentTab: snapshot.data,
              ),
            );
          }),
    );
  }

  List<Widget> listTab() {
    return <Widget>[
      Container(),
      Container(
        child: Center(
          child: Text('tab1'),
        ),
      ),
      Container(
        child: Center(
          child: Text('tab2'),
        ),
      ),
    ];
  }
}
