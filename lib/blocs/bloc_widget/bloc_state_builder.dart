import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

typedef Widget AsyncBlocStateBuilder<BlocState>(
    BuildContext context, BlocState state);

class BlocEventStateBuilder<BlocState> extends StatelessWidget {
  final BlocEventStateBase<BlocEvent, BlocState> bloc;
  final AsyncBlocStateBuilder<BlocState> builder;

  const BlocEventStateBuilder(
      {Key key, @required this.builder, @required this.bloc})
      : assert(builder != null),
        assert(bloc != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocState>(
      stream: bloc.state,
      initialData: bloc.initState,
      builder: (BuildContext context, AsyncSnapshot<BlocState> snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
