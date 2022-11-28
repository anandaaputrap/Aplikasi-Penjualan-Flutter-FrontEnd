import 'package:flutter/cupertino.dart';
import 'package:projekakhir/models/usermodel.dart';
import 'package:projekakhir/services/authservice.dart';

import 'package:flutter/material.dart';
class AuthProvider with ChangeNotifier{
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {String name, String username, String email, String nomor, String alamat, String password,}) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        nomor: nomor,
        alamat: alamat,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login(
      {String email, String password}) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}