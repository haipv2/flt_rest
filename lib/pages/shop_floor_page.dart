import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

import 'shop_floor_detail_page.dart';

class ShopTablePage extends StatefulWidget {
  final Shop shop;

  ShopTablePage(this.shop);

  @override
  _ShopTablePageState createState() => _ShopTablePageState();
}

class _ShopTablePageState extends State<ShopTablePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ShopBloc shopBloc;

  @override
  void initState() {
    super.initState();
    shopBloc = new ShopBloc();
    _tabController =
        TabController(vsync: this, length: widget.shop.floorList.length);
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
              body: TabBarView(
                controller: _tabController,
                children: buildTabContent(),
              ),
              appBar: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.orange,
                  indicatorColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  tabs: buildTabLabel()),
//              drawer: ShopDrawer(),
            );
          }),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Tab> buildTabLabel() {
    List<Tab> result = [];
    for (var i = 1; i <= widget.shop.floorList.length; i++) {
      result.add(Tab(text: 'Tang $i'));
    }
    return result;
  }

  List<Widget> buildTabContent() {
    List<Widget> result = [];
    for (var floor in widget.shop.floorList) {
      result.add(ShopFloorDetailPage(floor));
    }
    return result;
  }
}
