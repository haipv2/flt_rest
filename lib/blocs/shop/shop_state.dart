import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';

class ShopState extends BlocState {
  final bool isDone;
  final bool isLoading;
  final bool isLoadingDetail;

  ShopState({this.isDone, this.isLoading: true, this.isLoadingDetail: true});

  factory ShopState.start() {
    return ShopState(
      isLoading: false,
      isDone: false,
    );
  }

  factory ShopState.loading() {
    return ShopState(
      isLoading: true,
      isDone: false,
    );
  }

  factory ShopState.loadingDetail() {
    return ShopState(
      isLoading: false,
      isLoadingDetail: true,
      isDone: false,
    );
  }

  factory ShopState.loaded() {
    return ShopState(
      isLoading: false,
      isDone: true,
      isLoadingDetail: false,
    );
  }
}
