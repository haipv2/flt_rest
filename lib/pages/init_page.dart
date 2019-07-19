import 'package:flt_rest/blocs/bloc_widget/bloc_state_builder.dart';
import 'package:flt_rest/blocs/init/init_bloc.dart';
import 'package:flt_rest/blocs/init/init_event.dart';
import 'package:flt_rest/blocs/init/init_state.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {

  InitBloc initBloc;

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
      child: Scaffold(
        body: Container(
          child: BlocEventStateBuilder<InitState>(
            bloc: initBloc,
            builder: (BuildContext context, InitState state){
              if (state.isInited){
                // init complete, move to another page
                WidgetsBinding.instance.addPostFrameCallback((_){
                  Navigator.of(context).pushReplacementNamed('/init');
                });
              }
              return Text('... ${state.progress}');
            },
          ),
        ),
      )
    );
  }
}

