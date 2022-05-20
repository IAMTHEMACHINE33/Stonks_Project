import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SizedBox(
                child: Container(
                  child: Image.asset('assets/images/tlogo.png',fit: BoxFit.cover,),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Form(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 2),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter Name',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter Username',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText:'Pasword',
                          hintText: '*******',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          child: const Text('Register'),
                          onPressed: (){
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Already have n ccount? Login')
                      ),

                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}