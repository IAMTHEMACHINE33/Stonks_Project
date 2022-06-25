import 'package:portfolio_management/api/user_api.dart';
import 'package:portfolio_management/response/load_user_response.dart';

import '../models/user.dart';

class UserRepository {
  Future<bool> register(User user) async {
    return await UserApi().register(user);
  }

  Future<bool> login(String email, String password) async {
    return UserApi().login(email, password);
  }

  Future<LoadUserResponse?> loadUser() async {
    return UserApi().loadUser();
  }
}
