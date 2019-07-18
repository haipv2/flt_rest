import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';

import 'init_event.dart';
import 'init_state.dart';

class InitBloc extends BlocEventStateBase<InitEvent, InitState> {
  InitBloc()
      : super(
          initState: InitState.notInit(),
        );

  @override
  Stream<InitState> eventhandler(
      InitEvent event, InitState currentState) async* {
    if (!currentState.isInited) {
      yield InitState.notInit();
    }

    if (event.type == InitEventType.start) {
      for (int progress = 0; progress < 101; progress += 10) {
        await Future.delayed(const Duration(milliseconds: 1000));
        yield InitState.progressing(progress);
      }
    }
    if (event.type == InitEventType.inited) {
      yield InitState.inited();
    }
  }
}
