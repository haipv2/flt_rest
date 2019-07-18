import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flutter/material.dart';

class InitState extends BlocState {
  final bool isInited;
  final bool isIniting;
  final int progress;

  InitState({@required this.isInited, this.isIniting: false, this.progress: 0});

  factory InitState.notInit() {
    return InitState(isInited: false);
  }

  factory InitState.progressing(int progress) {
    return InitState(
      isInited: progress == 100,
      isIniting: true,
      progress: progress,
    );
  }

  factory InitState.inited() {
    return InitState(
      isInited: true,
      progress: 100,
    );
  }
}
