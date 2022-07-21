import 'package:flutter/cupertino.dart';
import 'package:mercury_app/Models/user.dart';

class UserProvider with ChangeNotifier {
  late User user;

  void setUserValues (String names, String lastNames, String email, String CI) {
    user = User(names, lastNames, email, CI);
    notifyListeners();
  }

  User get getUser {
    return user;
  }
}