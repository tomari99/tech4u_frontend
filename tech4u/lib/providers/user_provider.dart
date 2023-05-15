import 'package:flutter/material.dart';
import 'package:tech4u/api/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      userName: '', email: '', password: '', id: '', userPhoto: '', token: '');

  User get user => _user;
  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
