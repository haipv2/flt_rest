import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/blocs/trans/trans_event.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/mixin/AppUtils.dart';
import 'package:flutter/material.dart';

import 'language_btn.dart';

class LanguageSettingWidget extends StatelessWidget with AppUtils {
  @override
  Widget build(BuildContext context) {
    TransBloc transBloc = BlocProvider.of<TransBloc>(context);
    GlobalKey<ScaffoldState> _keyContainerDialog = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _keyContainerDialog,
        body: Dialog(
          backgroundColor: Color(0xffF3E2A9),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              LanguageBtn(
                langTxt: ENGLISH_TXT,
                langCode: ENGLISH_CODE,
                isSelected:
                    globalBloc.currentLanguage == ENGLISH_CODE ? true : false,
                onPressed: () {
                  changeLanguage(ENGLISH_CODE, transBloc, _keyContainerDialog,
                      TransEvent());
                },
              ),
              LanguageBtn(
                langTxt: VIETNAM_TXT,
                langCode: VIETNAM_CODE,
                isSelected:
                    globalBloc.currentLanguage == VIETNAM_CODE ? true : false,
                onPressed: () {
                  changeLanguage(VIETNAM_CODE, transBloc, _keyContainerDialog,
                      TransEvent());
                },
              ),
            ],
          ),
        ));
  }
}
