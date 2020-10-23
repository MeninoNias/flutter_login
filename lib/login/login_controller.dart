import 'package:login_flutter/login/login_repository.dart';
import 'package:login_flutter/shared/model/user_model.dart';

class LoginController {
  LoginRepository repository = LoginRepository();

  login() async {
    UserModel temp = await repository.login() as UserModel;
    if (temp != null) {
      print(temp.username);
    }
  }
}
