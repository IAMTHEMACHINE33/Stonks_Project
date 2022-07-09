// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:portfolio_management/repository/user_repository.dart';
// import 'package:wear/wear.dart';

// class WearOsLoginScreen extends StatefulWidget {
//   const WearOsLoginScreen({Key? key}) : super(key: key);

//   @override
//   State<WearOsLoginScreen> createState() => _WearOsLoginScreenState();
// }

// class _WearOsLoginScreenState extends State<WearOsLoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   _navigateToScreen(bool isLogin) {
//     if (isLogin) {
//       true;
//     } else {
//       Fluttertoast.showToast(
//           msg: 'Either username or password is invalid',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.transparent,
//           textColor: Colors.black);
//     }
//   }

//   _login() async {
//     try {
//       UserRepository userRepository = UserRepository();
//       bool isLogin = await userRepository.login(
//         _emailController.text,
//         _passwordController.text,
//       );
//       if (isLogin) {
//         _navigateToScreen(true);
//       } else {
//         _navigateToScreen(false);
//       }
//     } catch (e) {
//       Fluttertoast.showToast(
//           msg: "Error",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.transparent,
//           textColor: Colors.black);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WatchShape(
//         builder: (BuildContext context, WearShape shape, Widget? child) {
//       return AmbientMode(builder: (context, mode, child) {
//         return Scaffold(
//             body: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: "Email",
//                 ),
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: "Password",
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         _login();
//                       },
//                       child: const Text('Add')))
//             ],
//           ),
//         ));
//       });
//     });
//   }
// }
