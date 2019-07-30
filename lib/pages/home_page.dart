import 'package:flt_rest/models/shop.dart';
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
      drawer: myPageDrawer(),
      body: Container(
        child: StreamBuilder<List<Shop>>(
            stream: bloc
            builder:(BuilderContext context, AsyncSnapshot snapshot){

      }
        ),
      ),
    );
  }

  Widget myPageDrawer() {
    Size size = MediaQuery.of(context).size;
//    String imageUrl = widget.user.gender == 1
//        ? 'assets/images/male.png'
//        : 'assets/images/female.png';
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
                  leading: const Icon(Icons.account_circle),
                  title: Text('User\'s info'),
                  onTap: () {
//                    Navigator.of(context)
//                        .push(MaterialPageRoute(builder: (context) {
//                      return userInfo.UserInfo(widget.user, imageUrl);
//                    }
//                    )
//                    );
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
