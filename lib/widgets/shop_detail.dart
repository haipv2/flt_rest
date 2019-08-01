import 'package:flt_rest/blocs/bloc_widget/bloc_state_builder.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/blocs/shop/shop_event.dart';
import 'package:flt_rest/blocs/shop/shop_state.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocEventStateBuilder<ShopState>(
        bloc: shopBloc,
        builder: (BuildContext context, ShopState state) {
          return Center(
            child: Text('Shop Area -id: ${widget.shop.shopId}'),
          );
        },
      ),
      appBar: AppBar(
        title: Text(widget.shop.shopName),
      ),
      drawer: ShopDrawer(),
      bottomNavigationBar: ShopBottomBar(shop: widget.shop),
    );
  }
}
