import 'package:flutter/material.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';

import 'commons/const.dart';
import 'pages/init_page.dart';
import 'pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repos/preferences.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  TransBloc transBloc;

  @override
  void initState() {
    super.initState();
    transBloc = TransBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransBloc>(
      bloc: transBloc,
      child: BlocProvider<AuthBloc>(
        bloc: AuthBloc(),
        child: StreamBuilder(
          stream: transBloc.currentLocale,
          builder: (BuildContext context, AsyncSnapshot<Locale> snapshot) {
            return MaterialApp(
              title: 'Restaurant-Drink',
              theme: ThemeData(
                primarySwatch: Colors.orange,
              ),
              routes: {
                TIPS_PAGE: (BuildContext context) => InitPage(),
                HOME_PAGE: (BuildContext context) => SplashPage(),
              },
              home: _buildHomepage(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHomepage() {
    bool seen = preferences.getBool(SEEN) ?? false;
    return Container(
      child: Center(
        child: Text('HOME PAGE'),
      ),
    );
  }
}
