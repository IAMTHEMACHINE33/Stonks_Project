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
              flex: 5,
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
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter Name',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter Username',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText:'Pasword',
                          hintText: '*******',
                          border: OutlineInputBorder()
                        ),
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