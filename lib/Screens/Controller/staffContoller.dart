import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffController extends GetxController {

  RxInt tab = 0.obs;
  RxInt availableBedroll = 300.obs;
  TextEditingController pnrController = TextEditingController();
  RxString pnr = "".obs;

  RxList<AssignedRequest> activeList = <AssignedRequest>[].obs;

  RxList<AssignedRequest> list = <AssignedRequest>[].obs;

  RxList<StaffData> registerList = <StaffData>[].obs;

  StaffController() {
    // Add dummy items
    list.addAll([
      AssignedRequest(pnr: "76897987988", coach: "S1", seatNumbers: "4, 5, 6"),
      AssignedRequest(pnr: "97897867879", coach: "H1", seatNumbers: "11"),
      AssignedRequest(pnr: "68907879899", coach: "B1", seatNumbers: "45, 46, 47"),
      AssignedRequest(pnr: "97756467689", coach: "S9", seatNumbers: "55, 66, 67")
    ]);
    activeList.addAll([
      AssignedRequest(pnr: "97897867879", coach: "H1", seatNumbers: "11"),
      AssignedRequest(pnr: "68907879899", coach: "B1", seatNumbers: "45, 46, 47"),
      AssignedRequest(pnr: "97756467689", coach: "S4", seatNumbers: "55, 66, 67")
    ]);
    registerList.addAll([
        StaffData(username: "Suhail", password: "suhail123"),
        StaffData(username: "Himanshu", password: "himanshuwch"),
        StaffData(username: "Sarthak", password: "sarthakkumar")
      ]
    );
  }

  TextEditingController usernameController = TextEditingController();
  RxString username = "".obs;
  TextEditingController passwordController = TextEditingController();
  RxString password = "".obs;


  bool checkCredentials() {
    return registerList.any((passenger) => 
      passenger.username == username.value && 
      passenger.password == password.value
    );
  }

}


class StaffData {
  final String username;
  final String password;

  StaffData({required this.username, required this.password});
}


class AssignedRequest {
  final String pnr;
  final String coach;
  final String seatNumbers;

  AssignedRequest({required this.pnr, required this.coach, required this.seatNumbers});
}
