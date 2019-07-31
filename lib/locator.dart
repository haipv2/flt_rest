import 'package:get_it/get_it.dart';

import 'repos/firestore_provider.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FirestoreProvider());
}
