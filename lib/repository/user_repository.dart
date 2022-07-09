import 'package:portfolio_management/api/user_api.dart';

import '../models/user.dart';
import '../response/user_response.dart';

class UserRepository {
  Future<bool> register(User user) async {
    return await UserApi().register(user);
  }

  Future<bool> login(String email, String password) async {
    return UserApi().login(email, password);
  }

  Future<UserResponse> userInfo() async {
    return UserApi().userInfo();
  }
}
