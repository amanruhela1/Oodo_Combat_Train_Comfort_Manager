import 'package:bedroll_distribution/Login%20Modules/Controller/registerController.dart';
import 'package:bedroll_distribution/Login%20Modules/staffLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPassenger extends StatelessWidget {
  const RegisterPassenger({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterPassengerController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.railway_alert, color: Colors.white, size: 28,),
        backgroundColor: Colors.orange,
        title: Text("Train Comfort Manager", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
      ),
      body: Obx(
        () =>
        Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Registration", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w700, fontSize: 24),),
              SizedBox(height: 15,),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,                    
                  ),
                ),
                onChanged: (value) {
                  controller.name.value = value;
                },
              ),
              SizedBox(height: 15,),
              TextField(
                controller: controller.numberController,
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
                  controller.number.value = value;
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
                  hintText: 'Enter password',
                  hintStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,                    
                  ),
                ),
                onChanged: (value) {
                  controller.password.value = value;
                },
              ),
              SizedBox(height: 15,),
              TextField(
                controller: controller.rePasswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: !controller.checkPass() ? "Password didn't match" : null,
                  hintText: 'Confirm password',
                  hintStyle: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,                    
                  ),
                ),
                onChanged: (value) {
                  controller.rePassword.value = value;
                },
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add, color: Colors.white,),
                    SizedBox(width: 6,),
                    Text('Create Account', style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10, 
                      fontStyle: FontStyle.normal),
                ),
                onPressed: controller.checkPass() ? () {

                  controller.registerList.add(
                      RegisterPassengerData(
                        name: controller.name.value,
                        number: controller.number.value,
                        password: controller.password.value,
                      ),
                  );
                  Navigator.pop(context);   

                } : null,
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}