import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/bloc_widget/bloc_state_builder.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/blocs/shop/shop_event.dart';
import 'package:flt_rest/blocs/shop/shop_state.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/widgets/drawer_widget.dart';
import 'package:flt_rest/widgets/pending.dart';
import 'package:flt_rest/widgets/shop_bottom_bar.dart';
import 'package:flt_rest/widgets/shop_menu.dart';
import 'package:flutter/material.dart';

import 'shop_floor_page.dart';

class ShopDetail extends StatefulWidget {
  final Shop shop;

  ShopDetail({this.shop});

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
    _tabController =
        TabController(vsync: this, length: widget.shop.floorList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<ShopState>(
      bloc: shopBloc,
      builder: (BuildContext context, ShopState state) {
        if (state.isLoadingDetail){
          return PendingPage();
        }
        if (state.isDone) {
          return pageContent(context);
        }
        return PendingPage();
      },
    );
  }

  Widget pageContent(BuildContext context) {
    return BlocProvider<ShopBloc>(
      bloc: shopBloc,
      child: StreamBuilder(
          stream: shopBloc.streamBottomBar,
          initialData: shopBloc.defaultTabBar,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: listTabBottom().elementAt(snapshot.data),
//              appBar: AppBar(
//                title: Text(widget.shop.shopName),
//              ),
//              drawer: ShopDrawer(),
              bottomNavigationBar: ShopBottomBar(
                shop: widget.shop,
                currentTab: snapshot.data,
              ),
            );
          }),
    );
  }

  List<Widget> listTabBottom() {
    return <Widget>[
      Container(),
      Container(
        child: Center(
          child: ShopMenu(shop: widget.shop),
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
