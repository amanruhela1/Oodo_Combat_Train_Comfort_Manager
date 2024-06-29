import 'package:bedroll_distribution/Login%20Modules/adminLogin.dart';
import 'package:bedroll_distribution/Login%20Modules/registerPassenger.dart';
import 'package:bedroll_distribution/Login%20Modules/staffLogin.dart';
import 'package:bedroll_distribution/Screens/Controller/passengerController.dart';
import 'package:bedroll_distribution/Screens/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassengerHomeScreen extends StatelessWidget {
  const PassengerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PassengerController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.railway_alert, color: Colors.white, size: 28,),
        backgroundColor: Colors.orange,
        title: Text("Train Comfort Manager", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));
              },
              child: Icon(Icons.account_circle_outlined, color: Colors.white, size: 28,)
            ),
          )
        ],
      ),
      
      body: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 25,),
                Row(
                  children: [
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Request Bedroll', style: TextStyle(fontSize: 18, color: Colors.white,),),
                          SizedBox(width: 6,),
                          Icon(Icons.add, color: Colors.white,),
                          
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
                        controller.pnrController.clear();
                        controller.pnr.value = "";
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: Text('Request Bedroll'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: Column(
                                    children: <Widget>[
                                      TextField(
                                        controller: controller.pnrController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'PNR',
                                          icon: Icon(Icons.account_box),
                                        ),
                                        onChanged: (value) {
                                          controller.pnr.value = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                Center(
                                  child: ElevatedButton(
                                    child: Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white,)),
                                    onPressed: () {
                                      if(controller.pnr.isNotEmpty)
                                      controller.activeList.add(
                                        UserRequest(pnr: controller.pnr.value,)
                                      );
                                      Navigator.pop(context);
                                      print(controller.pnr);
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
                      }
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.tab.value = 0;
                      },
                      child: Text("Active Request", style: TextStyle(color: controller.tab.value == 0 ? Colors.amber : Colors.grey, fontWeight: FontWeight.w700, fontSize: 18),)
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.tab.value = 1;
                      },
                      child: Text("Past Request", style: TextStyle(color: controller.tab.value == 1 ? Colors.amber : Colors.grey, fontWeight: FontWeight.w700, fontSize: 18),)
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                if(controller.tab.value == 0)
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.activeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text("${index+1}"),
                        ),
                        title: Text('PNR: ${controller.pnr}'),
                        // subtitle: Text('Please provide towel'),
                      );
                    },
                  ),
                ),
                if(controller.tab.value == 1)
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text("${index+1}"),
                        ),
                        title: Text('PNR: ${controller.list.value[index].pnr}'),
                        // subtitle: Text('${controller.list.value[index].description}'),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}