import 'package:bedroll_distribution/Login%20Modules/Controller/registerController.dart';
import 'package:bedroll_distribution/Screens/Controller/staffContoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffProfile extends StatelessWidget {
  const StaffProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StaffController());
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
              child: Text("${controller.username.value[0]}"),
            ),
            title: Text('${controller.username}'),
          )
        ],
      ),
    );
  }
}