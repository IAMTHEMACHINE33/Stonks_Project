import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_management/models/user.dart';
import 'package:portfolio_management/repository/user_repository.dart';

void main() {
  late UserRepository? userRepository;

  setUp(() {
    userRepository = UserRepository();
  });
  group('User', () {
    test('Signup', () async {
      bool expectedResult = true;
      User user = User(
          firstname: "Rijan",
          lastname: "Maharjan",
          age: "18",
          username: "Machine33",
          email: "machine@gmail.com",
          password: "asdf1234");

      bool actualResult = await userRepository!.register(user);

      expect(expectedResult, actualResult);
    });

    test('login', () async {
      bool expectedResult = true;
      bool actualResult =
          await UserRepository().login("machine@gmail.com", "asdf1234");

      expect(expectedResult, actualResult);
    });

    // test('load', () async {
    //   bool expectedResult = true;
    //   LoadUserResponse? actualResult = await UserRepository().loadUser();

    //   expect(expectedResult, actualResult);
    // });
  });

  tearDown(() {
    userRepository = null;
  });
}
