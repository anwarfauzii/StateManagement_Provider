import 'package:flutter/material.dart';
import 'package:latihan_state_management/models/user_model.dart';
import 'package:latihan_state_management/services/user_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? user = UserModel();

  Future<bool> getUser() async {
    final result = await UserService().getUser();
    user = result;

    if (result == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> checkToken() async {
    final result = await UserService().getToken();
    user!.token = result;

    if (result == null) {
      return false;
    } else {
      return true;
    }
  }

removeToken(){
  final result = UserService().removeToken();
  return result;
}
}
