import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flutter/material.dart';

class AppUtils {
  void changeLanguage(String langCode, TransBloc transBloc, BlocEvent event,
      BuildContext context) {
    if (langCode == globalBloc.currentLanguage) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('dataSet')));
//      context.ancestorWidgetOfExactType(Scaffold).
      return;
    }
    transBloc.setNewLanguage(langCode);
    transBloc.addEvent(event);
  }
}
