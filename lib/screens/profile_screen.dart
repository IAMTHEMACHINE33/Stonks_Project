import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height * .17,
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(
                      children: const [
                        CircleAvatar(
                          radius: 50,
                        ),
                        Positioned(
                            bottom: 5,
                            right: 3,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 15,
                            ))
                      ],
                    ),
                    const Text(
                      'Username',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    color: Colors.green,
                  ),
                  Positioned(
                      top: 30,
                      right: 25,
                      child: Container(
                        child: const Text(
                          "\$\$\$\$\$",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: const ListTile(
                    leading: Icon(Icons.insert_drive_file_outlined),
                    title: Text("My Information"),
                    subtitle: Text("View your personal details"),
                    trailing: Icon(Icons.arrow_forward_ios)),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text("Settings"),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: const ListTile(
                    leading: Icon(Icons.notifications_on),
                    title: Text("Privacy"),
                    subtitle: Text("Change profile settings"),
                    trailing: Icon(Icons.arrow_forward_ios)),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: const ListTile(
                    leading: Icon(Icons.group),
                    title: Text("Notification"),
                    subtitle: Text("Change notification settings"),
                    trailing: Icon(Icons.arrow_forward_ios)),
              ),
            ],
          )),
    );
  }
}
