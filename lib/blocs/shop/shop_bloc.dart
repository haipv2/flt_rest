import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:rxdart/rxdart.dart';

import 'shop_event.dart';
import 'shop_state.dart';

class ShopBloc extends BlocEventStateBase<ShopEvent, ShopState> {
  ShopBloc()
      : super(
          initState: ShopState.loading(),
        );

  BehaviorSubject<int> _streamBottomBarCtl = BehaviorSubject<int>();

  Observable<int> get streamBottomBar => _streamBottomBarCtl.stream;

  Function(int) get selectTab => _streamBottomBarCtl.sink.add;

  int get defaultTabBar => 1;

  int get currentTabBottom => 1;

  @override
  Stream<ShopState> eventhandler(
      ShopEvent event, ShopState currentState) async* {
    if (currentState == ShopState.loadingDetail()) {
      await Future.delayed(Duration(seconds: 2));
      yield ShopState.loaded();
    } else {
      await Future.delayed(Duration(seconds: 1));
      yield ShopState.loaded();
    }
  }
}
