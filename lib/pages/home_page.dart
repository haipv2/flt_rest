import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/blocs/home/home_bloc.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/widgets/drawer_widget.dart';
import 'package:flt_rest/widgets/language_widget.dart';
import 'package:flt_rest/widgets/settings_icon.dart';
import 'package:flt_rest/widgets/shop_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePageState homeState;
  @override
  HomePageState createState() {
    homeState = HomePageState();
    return homeState;
  }
}

class HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = new HomeBloc();
  }
  GlobalKey<ScaffoldState> keyScaffoldApp = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String txtShopList = globalBloc.text('pages.homePage.title.bar');
    return Scaffold(
      key: keyScaffoldApp,
      appBar: AppBar(
        title: Text(
          txtShopList,
          style: TextStyle(fontFamily: 'indie flower'),
        ),
      ),
      drawer: ShopDrawer(),
      body: Container(
        child: StreamBuilder<List<Shop>>(
            stream: bloc.shops,
            builder:
                (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ShopItem(shop: snapshot.data[index]);
                  });
            }),
      ),
    );
  }

  void removeUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.remove(USER_PREFS_KEY);
//    prefs.remove(SETTING_SOUND);
  }
}
