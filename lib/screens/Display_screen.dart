import 'package:flutter/material.dart';

import 'dashboard_scren.dart';

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
    await Future.delayed(Duration(milliseconds: 1500),() {});
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Center(
        child: Container(
          color: Colors.green,
          height: height,
          width: width,
          child: Image.asset('assets/images/tlogo.png',fit: BoxFit.fill),
        ),
      )
    );
  }
}