import 'dart:async';

import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flutter/material.dart';
import '../../repos/preferences.dart';
import '../bloc_provider.dart';
import '../../services/trans_services.dart';
import 'trans_event.dart';
import 'trans_state.dart';

class TransBloc extends BlocEventStateBase<TransEvent, TransState> {
  StreamController<String> _langController =
      StreamController<String>.broadcast();

  Stream<String> get currentLanguage => _langController.stream;

  StreamController<Locale> _localeController = StreamController<Locale>();

  Stream<Locale> get currentLocale => _localeController.stream;

  @override
  void dispose() {
    _langController?.close();
    _localeController?.close();
  }

  void setNewLanguage(String newLanguage) async {
    //save the selected language as new preference
    await preferences.setPreferredLanguage(newLanguage);

    //Notification the translation module about new language
    await allTranslations.setNewLanguage(newLanguage);

    _langController.sink.add(newLanguage);
    _localeController.sink.add(allTranslations.locale);
  }

  @override
  Stream<TransState> eventhandler(TransEvent event, TransState currentState) {
    // TODO: implement eventhandler
    return null;
  }
}
