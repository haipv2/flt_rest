import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';

class ShopEvent extends BlocEvent {
  final ShopEventType type;

  ShopEvent({this.type: ShopEventType.start}) : assert(type != null);
}

enum ShopEventType {
  start,
  changing,
  changed,
  loading,
  loadingDetail
}
