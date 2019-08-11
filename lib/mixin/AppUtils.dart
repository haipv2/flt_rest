import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flt_rest/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppUtils {
  void changeLanguage(String langCode, TransBloc transBloc, BlocEvent event,
      BuildContext context) {
    if (langCode == globalBloc.currentLanguage) {
      try {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('dataSet')));
      } catch (e) {
        print(e);
      };
      return;
    }
    transBloc.setNewLanguage(langCode);
    transBloc.addEvent(event);
  }
}
