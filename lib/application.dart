import 'package:flutter/material.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';

import 'pages/init_page.dart';
import 'pages/splash_page.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransBloc>(
      bloc: TransBloc(),
      child: BlocProvider<AuthBloc>(
        bloc: AuthBloc(),
        child: MaterialApp(
          title: 'Restaurant-Drink',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          routes: {
            '/init': (BuildContext context) => InitPage(),
            '/splash': (BuildContext context) => SplashPage(),
          },
        ),
      ),
    );
  }
}
