import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

import 'shop_bottom_bar.dart';

class ShopMenu extends StatefulWidget {
  final Shop shop;

  ShopMenu({@required this.shop});

  @override
  _ShopMenuState createState() => _ShopMenuState();
}

class _ShopMenuState extends State<ShopMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shop.shopName),
      ),
      body: Container(

      ),
      bottomNavigationBar: ShopBottomBar(shop: widget.shop),
    );
  }
}
