import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

class ShopArea extends StatefulWidget {
  final Shop shop;

  ShopArea({@required this.shop});

  @override
  _ShopAreaState createState() => _ShopAreaState();
}

class _ShopAreaState extends State<ShopArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Center(
        child: Text('Shop Area -id: ${widget.shop.shopId}'),
      ),
    );
  }
}
