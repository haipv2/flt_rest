import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/models/shop.dart';
import 'package:flt_rest/models/user.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;
  FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  Future<User> registerUser(User user) async {
    DatabaseReference child = _firebaseDatabase.reference().child(TBL_USERS);
    await child.child(user.loginId).set(<String, String>{
      USER_EMAIL: user.email,
      USER_FIRST_NAME: user.firstname,
      USER_LAST_NAME: user.lastname,
      USER_PASSWORD: user.password,
      USER_GENDER: user.gender.toString(),
      USER_ROLE: user.role ?? 'USER',
      USER_LOGIN_ID: user.loginId,
    });
    return user;
  }

  Future<User> authenticateUser(String loginId, String password) async {
    DatabaseReference child = _firebaseDatabase.reference().child(TBL_USERS);
    DataSnapshot snapshot = await child.once();
    Map<String, dynamic> users = snapshot.value.cast<String, dynamic>();
    User result;
    users.forEach((key, userMap) {
      if (key == loginId)
        result = getUserByLoginAndPassword(loginId, password, userMap);
    });

    return result;
  }

  User getUserByLoginAndPassword(String loginIdInput, String passwordInput,
      Map<dynamic, dynamic> userMap) {
    String email, password, firstName, lastName, loginId;
    int gender;
    userMap.forEach((key, value) {
      if (key == USER_EMAIL) {
        email = value.toString();
      } else if (key == USER_PASSWORD) {
        password = value.toString();
      } else if (key == USER_FIRST_NAME) {
        firstName = value.toString();
      } else if (key == USER_LAST_NAME) {
        lastName = value.toString();
      } else if (key == USER_GENDER) {
        gender = int.parse(value);
      } else if (key == USER_LOGIN_ID) {
        loginId = value.toString();
      }
    });
    if (password == passwordInput) {
      return User()
        ..loginId = loginId
        ..email = email
        ..firstname = firstName
        ..lastname = lastName
        ..email = email
        ..password = password
        ..gender = gender;
    }
    return null;
  }

  Future<User> getUserByLogin(loginIdInput) async {
    DataSnapshot snapshot =
        await _firebaseDatabase.reference().child(TBL_USERS).once();

    Map<String, dynamic> users = snapshot.value.cast<String, dynamic>();
    User result;
    users.forEach((key, value) {
      if (key == loginIdInput) {
        result = buildUserInfo(value);
        result.loginId = loginIdInput;
      }
    });

    return result;
  }

  User buildUserInfo(Map<dynamic, dynamic> userMap) {
    String email, password, firstName, lastName, loginId;
    int gender;
    userMap.forEach((key, value) {
      if (key == USER_EMAIL) {
        email = value.toString();
      } else if (key == USER_PASSWORD) {
        password = value.toString();
      } else if (key == USER_FIRST_NAME) {
        firstName = value.toString();
      } else if (key == USER_LAST_NAME) {
        lastName = value.toString();
      } else if (key == USER_GENDER) {
        gender = int.parse(value);
      } else if (key == USER_LOGIN_ID) {
        loginId = value.toString();
      }
    });
    var result = User()
      ..loginId = loginId
      ..email = email
      ..firstname = firstName
      ..lastname = lastName
      ..email = email
      ..password = password
      ..gender = gender;
    return result;
  }

  Future<List<User>> getAllUser() async {
    DataSnapshot snapshot =
        await _firebaseDatabase.reference().child(TBL_USERS).once();

    Map<String, dynamic> users = snapshot.value.cast<String, dynamic>();
    List<User> result = [];
    users.forEach((key, value) {
      return result.add(buildUserInfo(value));
    });
    return result;
  }

  Future<List<User>> getAllUserExceptLoginId(String currentLoginId) async {
    DataSnapshot snapshot =
        await _firebaseDatabase.reference().child(TBL_USERS).once();

    Map<String, dynamic> users = snapshot.value.cast<String, dynamic>();
    List<User> result = [];
    users.forEach((key, value) {
      if (key == currentLoginId) return;
      return result.add(buildUserInfo(value));
    });
    return result;
  }

  List<Shop> getAllShop() {
//    _firestore.collection(TBL_SHOPS).getDocuments().then((QuerySnapshot snapshot){
//
//    });

    List<Shop> demo = new List();
    demo.add(Shop(shopId: 1, shopName: 'Banh Xeo Tu Dong', shopAddr: 'google'));
//    print('-----shop length----${demo.length}');
    return demo;
  }
}
