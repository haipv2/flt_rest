
import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

class ShopTableItem extends StatefulWidget {
  final Shop shop;

  ShopTableItem(this.shop);

  @override
  _ShopTableItemState createState() => _ShopTableItemState();
}

class _ShopTableItemState extends State<ShopTableItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.shop.shopName),
    );
  }
}
