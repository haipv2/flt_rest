import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/models/food.dart';
import 'package:flt_rest/models/menu.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flutter/material.dart';

import 'shop_menu_item.dart';

class ShopMenu extends StatefulWidget {
  final Shop shop;
  List<Food> foods;

  ShopMenu({@required this.shop, this.foods}) {
    this.foods = Menu.menu;
  }

  @override
  _ShopMenuState createState() => _ShopMenuState();
}

class _ShopMenuState extends State<ShopMenu>
    with SingleTickerProviderStateMixin {
  final PageController _backgroundPageController = new PageController();
  Color _backColor = Color.fromRGBO(240, 232, 223, 1.0);
  bool showQuantity = false;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.orange,
        indicatorColor: Colors.orange,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        tabs: _buildTabLabelMenu(),
      ),
      body: TabBarView(
        children: _buildTabMenuContent(),
        controller: _tabController,
      ),
    );
  }

  void _showQuantityWidget() {
    setState(() {
      showQuantity = true;
    });
  }

  List<Tab> _buildTabLabelMenu() {
    String dishes = globalBloc.text('menu.dishes');
    String drink = globalBloc.text('menu.drink');
    List<Tab> result = [
      Tab(
        text: dishes,
      ),
      Tab(
        text: drink,
      ),
    ];
    return result;
  }

  _buildTabMenuContent() {
    return <Widget>[
      Stack(children: <Widget>[
        GestureDetector(
          onTap: _showQuantityWidget,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 50.0,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),
              itemCount: widget.foods.length,
              itemBuilder: (BuildContext context, int index) {
                return ShopMenuItem(widget.foods[index]);
              }),
        ),
        showQuantity
            ? Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('add'),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(
                          color: Colors.grey[700],
                          width: 0.5,
                        ),
                      ),
                      child: new SizedBox(
                        width: 70.0,
                        height: 45.0,
                        child: new Center(
                            child: new Text('0',
                                style: Theme.of(context).textTheme.subhead,
                                textAlign: TextAlign.center)),
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                      label: Text('add'),
                    ),
                  ],
                ),
              )
            : Container(),
      ]),
      Container(
        child: Text('Drink some thing'),
      ),
    ];
  }
}
