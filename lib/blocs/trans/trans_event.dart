import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';

class TransEvent extends BlocEvent {
  final TransEventType type;

  TransEvent({this.type: TransEventType.change}) : assert(type != null);
}

enum TransEventType { change }
