import 'package:flutter/cupertino.dart';

import 'package:login_flutter/login/login_repository.dart';
import 'package:login_flutter/shared/model/user_model.dart';

class LoginController {
  LoginRepository repository = LoginRepository();

  Future<bool> login(String username, String pass) async {
    UserModel user = await repository.login(username, pass) as UserModel;
    if (user != null) {
      print(user.username);
      return true;
    } else {
      return false;
    }
  }
}
