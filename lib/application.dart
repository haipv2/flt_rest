import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/bloc_provider.dart';
import 'commons/const.dart';
import 'pages/home_page.dart';
import 'pages/init_page.dart';
import 'pages/splash_page.dart';
import 'pages/tips_page.dart';
import 'repos/preferences.dart';
import 'package:flt_rest/blocs/global_bloc.dart';

class Application extends StatefulWidget {

  Application();

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  TransBloc transBloc;

  @override
  void initState() {
    super.initState();
    transBloc = TransBloc();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
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

              // multi lang
              locale: snapshot.data ?? globalBloc.locale,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: globalBloc.supportedLocales(),

              routes: {
                PAGE_INIT: (BuildContext context) => InitPage(),
                PAGE_TIPS: (BuildContext context) => TipsPage(),
                PAGE_HOME: (BuildContext context) => HomePage(),
              },
              home: InitPage(),
            );
          },
        ),
      ),
    );
  }

}
