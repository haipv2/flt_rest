import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/repos/base_repository.dart';
import 'package:flt_rest/repos/shop_repos.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc_provider.dart';

class HomeBloc implements BlocBase {
  final _shopRepos = ShopRepos();

  // list all shops
  Set<Shop> _shopList = Set<Shop>();

  // stream to list all shop
  BehaviorSubject<List<Shop>> _shopsController = BehaviorSubject<List<Shop>>();

//  Stream<List<Shop>> get shops => _shopsController;
  Observable<List<Shop>> get shops => _shopsController.stream;

  @override
  void dispose() {
    _shopsController?.close();
  }

  HomeBloc() {
    _loadingShop();
  }

  void _loadingShop() {
    _shopsController.sink.add(_shopRepos.getAllShop());
  }
}
