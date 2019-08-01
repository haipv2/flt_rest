import 'package:flt_rest/blocs/bloc_widget/bloc_state_builder.dart';
import 'package:flt_rest/blocs/init/init_bloc.dart';
import 'package:flt_rest/blocs/init/init_event.dart';
import 'package:flt_rest/blocs/init/init_state.dart';
import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/repos/preferences.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  InitBloc initBloc;

//  var isFirstTime = checkFirstTime();
  @override
  void initState() {
    super.initState();
    initBloc = InitBloc();
    initBloc.addEvent(InitEvent());
  }

  @override
  void dispose() {
    super.dispose();
    initBloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: BlocEventStateBuilder<InitState>(
          bloc: initBloc,
          builder: (BuildContext context, InitState state) {
            if (state.isInited) {
              // init complete, move to another page
              WidgetsBinding.instance.addPostFrameCallback((_) {
                preferences.getBool(IS_FIRST_TIME).then((isFirstTime) {
                  if (isFirstTime == null || !isFirstTime) {
                    Navigator.of(context).pushReplacementNamed(PAGE_TIPS);
                  } else {
                    Navigator.of(context).pushReplacementNamed(PAGE_HOME);
                  }
                });
              });
            }
            return Center(child: Text('Ingrogress... ${state.progress} %'));
          },
        ),
      ),
    );
  }

  static checkFirstTime() async {
    return preferences.getBool(IS_FIRST_TIME);
  }
}
