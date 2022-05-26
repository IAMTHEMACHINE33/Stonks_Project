import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            Expanded(
              flex: 17,
              child: SizedBox(
                child: Container(
                  child: Image.asset('assets/images/tlogo.png',fit: BoxFit.fill),
                )
              ),
            ),
            Expanded(
              flex: 20,
              child: SizedBox(
                child: Container(
                  child: Form(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 8,4),
                          child: TextFormField(
                            decoration: const InputDecoration(  
                              labelText:'Email',
                              hintText: 'email@email.com',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(8,4,8,0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText:'Password',
                              hintText: '********',
                              border: OutlineInputBorder() 
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                           child: const Text('Forget Password?')
                           ),
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/nav');
                              },
                               child: const Text('Login')
                               ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/register');
                          },
                           child: const Text('New User? Register')
                           )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}