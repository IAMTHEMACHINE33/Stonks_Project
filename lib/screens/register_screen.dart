import 'package:flutter/material.dart';
import 'package:portfolio_management/repository/user_repository.dart';
import 'package:portfolio_management/utils/show_message.dart';

import '../models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _register(User user) async {
    bool isSignup = await UserRepository().register(user);
    if (isSignup) {
      _displayMessage(true);
      Navigator.pushNamed(context, 'login');
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isSignup) {
    if (isSignup) {
      displaySuccessMessage(context, "Register Success");
    } else {
      displayErrorMessage(context, "Registor Failed");
    }
  }

  // File? img;
  // Future _loadImage(ImageSource imageSource) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: imageSource);
  //     if (image != null) {
  //       setState(() {
  //         img = File(image.path);
  //       });
  //     } else {
  //       return;
  //     }
  //   } catch (e) {
  //     debugPrint('Failed to pick Image $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                child: Image.asset(
                  'assets/images/tlogo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Expanded(
            //   flex: 8,
            //   child: InkWell(
            //       onTap: () {
            //         showDialog(
            //             context: context,
            //             builder: (context) => AlertDialog(
            //                     title: const Text("Upload Image"),
            //                     actions: [
            //                       TextButton(
            //                         child: const Text("Open Camera"),
            //                         onPressed: () {
            //                           _loadImage(ImageSource.camera);
            //                         },
            //                       ),
            //                       TextButton(
            //                         child: const Text("Open Gallery"),
            //                         onPressed: () {
            //                           _loadImage(ImageSource.gallery);
            //                         },
            //                       )
            //                     ]));
            //       },
            //       child: _displayImage()),
            // ),
            Expanded(
              flex: 20,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: TextFormField(
                          key: const ValueKey('txtFirstname'),
                          controller: _firstnameController,
                          decoration: const InputDecoration(
                              labelText: 'Firstname',
                              hintText: 'Enter Firstname',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: TextFormField(
                          key: const ValueKey('txtLastname'),
                          controller: _lastnameController,
                          decoration: const InputDecoration(
                              labelText: 'Lastname',
                              hintText: 'Enter Lastname',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: TextFormField(
                          key: const ValueKey('txtAge'),
                          controller: _ageController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Age',
                              hintText: 'Enter Age'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: TextFormField(
                          key: const ValueKey('txtUsername'),
                          controller: _usernameController,
                          decoration: const InputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter Username',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: TextFormField(
                          key: const ValueKey('txtEmail'),
                          controller: _emailController,
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Email',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: TextFormField(
                          key: const ValueKey('txtPassword'),
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              labelText: 'Pasword',
                              hintText: '*******',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            key: const ValueKey('btnRegister'),
                            child: const Text('Register'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                User user = User(
                                  firstname: _firstnameController.text,
                                  lastname: _lastnameController.text,
                                  username: _usernameController.text,
                                  age: _ageController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                _register(user);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text('Already have n ccount? Login')),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 0,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  // Widget _displayImage() {
  //   return Container(
  //     margin: const EdgeInsets.all(8.0),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(18),
  //       child: img == null
  //           ? Image.network(
  //               'https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?k=20&m=1300845620&s=612x612&w=0&h=f4XTZDAv7NPuZbG0habSpU0sNgECM0X7nbKzTUta3n8=',
  //               fit: BoxFit.fill,
  //               // height: MediaQuery.of(context).size.height * 2,
  //               // width: double.infinity * 0.2,
  //             )
  //           : Image.file(img!),
  //     ),
  //   );
  // }
}
