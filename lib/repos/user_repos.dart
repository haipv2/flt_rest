import 'package:flt_rest/models/user.dart';

import 'base_repository.dart';

class UserRepos extends Repository{

  Future<User> registerUser(User user) async {
    var result = await firestoreProviderRealtime.registerUser(user);
    return result;
  }

  Future<User> authenticateUser(String loginId, String password) async {
    var result = firestoreProviderRealtime.authenticateUser(loginId, password);
    return result;
  }

  Future<User> getUserViaLoginId(String loginId) async{
    User result =await firestoreProviderRealtime.getUserByLogin(loginId);

    return result;
  }

  Future<List<User>> getAllUser() async{
    var result = await firestoreProviderRealtime.getAllUser();
    return result;
  }

  Future<List<User>>  getAllUserExceptLoginId(String currentLoginId) async{
    var result = await firestoreProviderRealtime.getAllUserExceptLoginId(currentLoginId);
    return result;
  }
  
}