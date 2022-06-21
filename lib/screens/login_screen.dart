import 'package:flutter/material.dart';
import 'package:portfolio_management/repository/user_repository.dart';
import 'package:portfolio_management/utils/show_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushNamed(context, '/nav');
    } else {
      displayErrorMessage(context, 'Either username or password is incorrect');
    }
  }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
        _emailController.text,
        _passwordController.text,
      );
      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      displayErrorMessage(context, "Error:${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 200,
                child: SizedBox(
                  child:
                      Image.asset('assets/images/tlogo.png', fit: BoxFit.fill),
                )),
            Expanded(
              flex: 20,
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'email@email.com',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                                  hintText: '********',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text('Forget Password?')),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _login();
                                    }
                                  },
                                  child: const Text('Login')),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text('New User? Register'))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 7,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
