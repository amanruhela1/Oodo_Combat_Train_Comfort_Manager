import 'package:flutter/material.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
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
                ),
                SizedBox(height: 15,),
                TextField(
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
                ),
                SizedBox(height: 25,),
              SizedBox(height: 25,),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.engineering, color: Colors.white,),
                    SizedBox(width: 6,),
                    Text('Continue as Admin', style: TextStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10, 
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}