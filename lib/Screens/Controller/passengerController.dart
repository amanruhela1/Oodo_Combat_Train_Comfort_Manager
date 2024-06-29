import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassengerController extends GetxController {

  RxInt tab = 0.obs;
  TextEditingController pnrController = TextEditingController();
  RxString pnr = "".obs;

  RxList<UserRequest> activeList = <UserRequest>[].obs;

  RxList<UserRequest> list = <UserRequest>[].obs;

  PassengerController() {
    // Add dummy items
    list.addAll([
      UserRequest(pnr: '6789678909',),
      UserRequest(pnr: '8989678909', ),
      UserRequest(pnr: '9889634909',),
    ]);
  }
}

class UserRequest {
  final String pnr;

  UserRequest({required this.pnr});
}
