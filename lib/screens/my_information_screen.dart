import 'package:flutter/material.dart';
import 'package:portfolio_management/repository/user_repository.dart';

import '../response/load_user_response.dart';

class MyInformationScreen extends StatefulWidget {
  const MyInformationScreen({Key? key}) : super(key: key);

  @override
  State<MyInformationScreen> createState() => _MyInformationScreenState();
}

class _MyInformationScreenState extends State<MyInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<LoadUserResponse?>(
          future: UserRepository().loadUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              debugPrint(snapshot.data.toString());
              if (snapshot.data != null) {
                LoadUserResponse loadUserResponse = snapshot.data!;

                return ListTile(
                  title: Text(loadUserResponse.lastname!),
                  subtitle: Text(loadUserResponse.firstname!),
                );
              } else {
                return const Center(
                  child: Text('No Data1'),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
