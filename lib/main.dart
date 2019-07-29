import 'package:flutter/material.dart';

import 'application.dart';
import 'commons/const.dart';
import 'repos/preferences.dart';
import 'services/trans_services.dart';

void main() async {
  // Initialize the translations module
  await allTranslations.init();
  runApp(Application());

}
