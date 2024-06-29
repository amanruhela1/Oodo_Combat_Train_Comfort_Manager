import 'package:bedroll_distribution/Login%20Modules/Controller/registerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterPassengerController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("User Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text("${controller.name.value[0]}"),
            ),
            title: Text('${controller.name}'),
            subtitle: Text('${controller.number}'),
          )
        ],
      ),
    );
  }
}