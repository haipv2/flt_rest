import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';

class ShopState extends BlocState {
  final bool isChanged;
  final bool isChanging;

  ShopState({this.isChanged, this.isChanging});

  factory ShopState.changing() {
    return ShopState(
      isChanging: true,
      isChanged: false,
    );
  }

  factory ShopState.start(){
    return ShopState(
      isChanging: false,
      isChanged: false,
    );
  }

  factory ShopState.changed() {
    return ShopState(
      isChanged: true,
      isChanging: false,
    );
  }
}
