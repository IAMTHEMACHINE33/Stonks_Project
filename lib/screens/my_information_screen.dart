import 'package:flutter/material.dart';
import 'package:portfolio_management/repository/user_repository.dart';
import 'package:portfolio_management/response/load_user_data.dart';
import 'package:portfolio_management/response/load_user_response.dart';

class MyInformationScreen extends StatefulWidget {
  const MyInformationScreen({Key? key}) : super(key: key);

  @override
  State<MyInformationScreen> createState() => _MyInformationScreenState();
}

class _MyInformationScreenState extends State<MyInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("My Details"),
              centerTitle: true,
            ),
            body: FutureBuilder<LoadUserResponse?>(
              future: UserRepository().loadUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<LoadUserData> lstUser = snapshot.data!.data!;

                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Text(lstUser[0].firstname!),
                          );
                        });
                  } else {
                    return const Center(child: Text("No data"));
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
                  );
                }
              },
            )));
  }
}
