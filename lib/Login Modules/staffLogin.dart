import 'package:bedroll_distribution/Screens/Controller/staffContoller.dart';
import 'package:bedroll_distribution/Screens/staffHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stafflogin extends StatelessWidget {
  const Stafflogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StaffController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Icon(Icons.railway_alert, color: Colors.white, size: 28,),
        title: Text("Train Comfort Manager", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Login", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w700, fontSize: 24),),
              SizedBox(height: 15,),
              TextField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,                    
                  ),
                ),
                onChanged: (value) {
                  controller.username.value = value;
                },
              ),
              SizedBox(height: 15,),
              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,                    
                  ),
                ),
                onChanged: (value) {
                  controller.password.value = value;
                },
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.engineering, color: Colors.white,),
                    SizedBox(width: 6,),
                    Text('Continue as Staff', style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10, 
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {
                  controller.checkCredentials();

                  if(controller.checkCredentials())
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StaffHomeScreen()));

                  if(!controller.checkCredentials())
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('Password or Number Incorrect'),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                child: Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white,)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10, 
                                    fontStyle: FontStyle.normal),
                                )
                              ),
                            ),
                          ],
                        );
                      },
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}