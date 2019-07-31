import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/blocs/home/home_bloc.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/widgets/language_widget.dart';
import 'package:flt_rest/widgets/settings_icon.dart';
import 'package:flt_rest/widgets/shop_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = new HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop list',
          style: TextStyle(fontFamily: 'indie flower'),
        ),
      ),
      drawer: myPageDrawer(context),
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

  Widget myPageDrawer(BuildContext context) {
    TransBloc _transBloc = BlocProvider.of<TransBloc>(context);
    Size size = MediaQuery.of(context).size;
//    String imageUrl = widget.user.gender == 1
//        ? 'assets/images/male.png'
//        : 'assets/images/female.png';
    String txtSetting = globalBloc.text('txtSetting');
    String txtLanguage = globalBloc.text('txtLanguage');
    return SizedBox(
      width: size.width * 3 / 4,
      child: Drawer(
          elevation: 2,
          child: Container(
            color: const Color(0xffF3E2A9),
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('test'),
                  accountEmail: Text('test'),
                  currentAccountPicture: Hero(
                    tag: '',
                    child: CircleAvatar(
                      child: Icon(Icons.insert_emoticon),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(txtLanguage),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return LanguageSettingWidget();
                        });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      removeUserInfo();
                      return HomePage();
                    }));
                  },
                ),
              ],
            ),
          )),
    );
  }

  void removeUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.remove(USER_PREFS_KEY);
//    prefs.remove(SETTING_SOUND);
  }
}
