import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';

class AppUtils {
  void changeLanguage(
      String langCode, TransBloc transBloc, GlobalKey key, BlocEvent event) {
    if (langCode == globalBloc.currentLanguage) {
      if (key is GlobalKey<ScaffoldState>) {
        key?.currentState.showSnackBar(SnackBar(content: Text('dataSet')));
      }
      return;
    }
    transBloc.setNewLanguage(langCode);
    transBloc.addEvent(event);
  }
}
