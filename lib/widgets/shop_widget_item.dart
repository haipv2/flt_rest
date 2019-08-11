import 'package:flt_rest/blocs/bloc_widget/bloc_state_builder.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/blocs/shop/shop_event.dart';
import 'package:flt_rest/blocs/shop/shop_state.dart';
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
  ShopBloc shopBloc;

  @override
  void initState() {
    super.initState();
    shopBloc = new ShopBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: BlocEventStateBuilder<ShopState>(
          bloc: shopBloc,
          builder: (BuildContext context, ShopState state) {
            if (state.isDone) {
            }
            return Center(
              child: InkWell(
                child: Text(widget.shop.shopName),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ShopDetail(shop: widget.shop)));
                },
              ),
            );
          }),
    );
  }
}
