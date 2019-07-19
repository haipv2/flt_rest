import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application.dart';
import 'blocs/trans/global_translations.dart';

void main() async {
  // Initialize the translations module
  await allTranslations.init();

  runApp(Application());
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.white
//      ),
////      home: HomePage(),
//    );
//  }
//}
