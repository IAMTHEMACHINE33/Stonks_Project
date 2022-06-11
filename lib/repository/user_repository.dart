import 'package:portfolio_management/api/user_api.dart';

import '../models/user.dart';

class UserRepository {
  Future<bool> register(User user) async {
    return await UserApi().register(user);
  }

  Future<bool> login(String username, String password) async {
    return UserApi().login(username, password);
  }
}
