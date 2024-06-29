import 'package:bedroll_distribution/Login%20Modules/adminLogin.dart';
import 'package:bedroll_distribution/Login%20Modules/registerPassenger.dart';
import 'package:bedroll_distribution/Login%20Modules/staffLogin.dart';
import 'package:bedroll_distribution/Screens/Controller/passengerController.dart';
import 'package:bedroll_distribution/Screens/Controller/staffContoller.dart';
import 'package:bedroll_distribution/Screens/staffProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StaffController());
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> StaffProfile()));
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.tab.value = 0;
                      },
                      child: Text("Assigned Deliveries", style: TextStyle(color: controller.tab.value == 0 ? Colors.amber : Colors.grey, fontWeight: FontWeight.w700, fontSize: 18),)
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.tab.value = 1;
                      },
                      child: Text("Completed Deliveries", style: TextStyle(color: controller.tab.value == 1 ? Colors.amber : Colors.grey, fontWeight: FontWeight.w700, fontSize: 18),)
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
                        title: Text('PNR: ${controller.activeList.value[index].pnr}'),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Coach Number: ${controller.activeList.value[index].coach}'),
                            Text('Seat Number: ${controller.activeList.value[index].seatNumbers}'),
                          ],
                        ),
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
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Coach Number: ${controller.list.value[index].coach}'),
                            Text('Seat Number: ${controller.list.value[index].seatNumbers}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}