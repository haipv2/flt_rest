import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';

enum InitEventType {
  start,
  inited,
}

class InitEvent extends BlocEvent {
  final InitEventType type;

  InitEvent({this.type: InitEventType.start}) : assert(type != null);
}
