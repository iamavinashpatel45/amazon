import 'package:amazon/models/user.dart';
import 'package:flutter/material.dart';

class user_provider extends ChangeNotifier {
  // ignore: prefer_final_fields
  User _user = User(
      id: "",
      name: "",
      email: "",
      password: "",
      address: "",
      type: "",
      token: "");

  User get user => _user;

  void setuser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
