import 'package:flt_rest/models/shop.dart';

import '../locator.dart';
import 'base_repository.dart';
import 'firestore_provider.dart';

class ShopRepos extends Repository {
  final _firebaseProvider = locator<FirestoreProvider>();

  List<Shop> getAllShop() {
    var result = _firebaseProvider.getAllShop();
    return result;
  }
}
