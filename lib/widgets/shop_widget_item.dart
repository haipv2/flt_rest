import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/pages/shop_detail_page.dart';
import 'package:flutter/material.dart';


class ShopItem extends StatefulWidget {
  final Shop shop;

  ShopItem({Key key, @required this.shop}) : super(key: key);

  @override
  _ShopItemState createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Center(
        child: InkWell(
          child: Text(widget.shop.shopName),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ShopDetail(shop: widget.shop)));
          },
        ),
      ),
    );
  }
}
