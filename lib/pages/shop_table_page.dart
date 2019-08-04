import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

import 'shop_table_item.dart';

class ShopTablePage extends StatefulWidget {
  final Shop shop;

  ShopTablePage(this.shop);

  @override
  _ShopTablePageState createState() => _ShopTablePageState();
}

class _ShopTablePageState extends State<ShopTablePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> listFloor = <Tab>[
    Tab(text: 'Tang 1'),
    Tab(text: 'Tang 2'),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: listFloor.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBarView(
        controller: _tabController,
        children: listFloor.map((item) {
          return Center(
            child: ShopTableItem(widget.shop),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
