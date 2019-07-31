import 'package:flutter/material.dart';

import 'application.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'commons/const.dart';
import 'locator.dart';
import 'repos/preferences.dart';

void main() async {
  // Initialize the translations module
  await globalBloc.init();
  setupLocator();
  runApp(Application());

}
