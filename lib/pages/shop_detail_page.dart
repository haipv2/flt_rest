import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/bloc_widget/bloc_state_builder.dart';
import 'package:flt_rest/blocs/shop/shop_bloc.dart';
import 'package:flt_rest/blocs/shop/shop_event.dart';
import 'package:flt_rest/blocs/shop/shop_state.dart';
import 'package:flt_rest/models/shop.dart';
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
//    shopBloc.addEvent(ShopEvent(type: ShopEventType.changed));
    _tabController =
        TabController(vsync: this, length: widget.shop.floorList.length);
    shopBloc.addEvent(ShopEvent(type: ShopEventType.loadingDetail));
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
        if (state.isLoadingDetail) {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<ShopBloc>(
      bloc: shopBloc,
      child: StreamBuilder(
          stream: shopBloc.streamBottomBar,
          initialData: shopBloc.defaultTabBar,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
//                buildShopDetailBar(),
                    listTabBottom().elementAt(snapshot.data),
                    Container(
                      height: width / 10,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: buildShopDetailBottomBar(snapshot)),
                    ),
                  ],
                )

//              drawer: ShopDrawer(),
//              bottomNavigationBar: ShopBottomBar(
//                shop: widget.shop,
//                currentTab: snapshot.data,
//              ),
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

  Widget buildShopDetailBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(widget.shop.shopName),
    );
  }

  Widget buildShopDetailBottomBar(AsyncSnapshot snapshot) {
    return ShopBottomBar(
      shop: widget.shop,
      currentTab: snapshot.data,
    );
  }
}
