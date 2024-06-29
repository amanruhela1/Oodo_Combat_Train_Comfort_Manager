import 'package:bedroll_distribution/Login%20Modules/Controller/registerController.dart';
import 'package:bedroll_distribution/Login%20Modules/adminLogin.dart';
import 'package:bedroll_distribution/Login%20Modules/registerPassenger.dart';
import 'package:bedroll_distribution/Login%20Modules/staffLogin.dart';
import 'package:bedroll_distribution/Screens/passengerHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLogin extends StatelessWidget {
  const ProfileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterPassengerController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.railway_alert, color: Colors.white, size: 28,),
        backgroundColor: Colors.orange,
        title: Text("Train Comfort Manager", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller.numberCheckController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your number',
                  hintStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,                    
                  ),
                ),
                onChanged: (value) {
                  controller.numberCheck.value = value;
                },
              ),
              SizedBox(height: 15,),
              TextField(
                controller: controller.passCheckController,
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
                  controller.passCheck.value = value;
                },
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.group, color: Colors.white,),
                    SizedBox(width: 6,),
                    Text('Continue as Passenger', style: TextStyle(fontSize: 18, color: Colors.white,),),
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
                  print(controller.checkCredentials());
                  if(controller.checkCredentials())
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PassengerHomeScreen()));

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
                    controller.numberCheckController.clear();
                    controller.numberCheck.value = "";
                    controller.passCheckController.clear();
                    controller.passCheck.value = "";
                },
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ", style: TextStyle(fontSize: 18, color: Colors.black45),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPassenger()));
                    },
                    child: Text('Signup', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a passender ? Login as ", style: TextStyle(fontSize: 18, color: Colors.black45),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Stafflogin()));
                    },
                    child: Text('Staff ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ),
                  Text('or ', style: TextStyle(fontSize: 18, color: Colors.black45),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminLogin()));
                    },
                    child: Text('Admin', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
