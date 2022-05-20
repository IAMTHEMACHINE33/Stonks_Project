import 'package:flutter/material.dart';


import 'login_screen.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({ Key? key }) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }
  
  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 2500),() {});
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Center(
        child: Container(
          // color: Colors.green,
          
          width: width,
          child: Image.asset('assets/images/tlogo.png',fit: BoxFit.fill),
        ),
      )
    );
  }
}