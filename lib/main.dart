import 'package:flutter/material.dart';

import 'application.dart';
import 'blocs/trans/global_translations.dart';
import 'commons/const.dart';
import 'repos/preferences.dart';

void main() async {
  // Initialize the translations module
  await allTranslations.init();
  preferences.getBool(IS_FIRST_TIME).then((value) {
    bool isFirstTime = value ?? true;
    runApp(Application(isFirstTime));
  });

}
