import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/blocs/shop/shop_event.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/pages/shop_table_page.dart';
import 'package:flt_rest/widgets/drawer_widget.dart';
import 'package:flt_rest/widgets/shop_bottom_bar.dart';
import 'package:flt_rest/widgets/shop_menu.dart';
import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget {
  final Shop shop;

  ShopDetail({@required this.shop});

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail>
    with SingleTickerProviderStateMixin {
  ShopBloc shopBloc;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    shopBloc = new ShopBloc();
    shopBloc.addEvent(ShopEvent(type: ShopEventType.changed));
    _tabController = TabController(vsync: this, length: listFloor.length);
  }

  final List<Tab> listFloor = <Tab>[
    Tab(text: 'Tang 1'),
    Tab(text: 'Tang 2'),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              body: snapshot.data == 2
                  ? TabBarView(
                      controller: _tabController,
                      children: listFloor.map((Tab tab) {
                        return Center(
                          child: Text(tab.text),
                        );
                      }).toList(),
                    )
                  : listTab().elementAt(snapshot.data),
              appBar: snapshot.data == 2
                  ? AppBar(
                      title: Text(widget.shop.shopName),
                      bottom: TabBar(
                          controller: _tabController,
                          tabs: listFloor.map((item) {
                            return Tab(
                              text: item.text,
                            );
                          }).toList()),
                    )
                  : AppBar(
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
          child: ShopMenu(shop: widget.shop),
//          child: Container(),
        ),
      ),
      Container(
        child: Center(
          child: ShopTablePage(widget.shop),
        ),
      ),
    ];
  }
}
