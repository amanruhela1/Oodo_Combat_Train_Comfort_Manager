import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPassengerController extends GetxController {

  TextEditingController nameController = TextEditingController();
  RxString name = "".obs;
  TextEditingController numberController = TextEditingController();
  RxString number = "".obs;
  TextEditingController passwordController = TextEditingController();
  RxString password = "".obs;
  TextEditingController rePasswordController = TextEditingController();
  RxString rePassword = "".obs;

  TextEditingController numberCheckController = TextEditingController();
  RxString numberCheck = "".obs;
  TextEditingController passCheckController = TextEditingController();
  RxString passCheck = "".obs;

  RxList<RegisterPassengerData> registerList = <RegisterPassengerData>[].obs;

  bool checkPass() {

    if(password == rePassword)
      return true;

    return false;

  }

  bool checkCredentials() {
    return registerList.any((passenger) => 
      passenger.number == numberCheck.value && 
      passenger.password == passCheck.value
    );
  }

}

class RegisterPassengerData {
  final String name;
  final String number;
  final String password;

  RegisterPassengerData({required this.name, required this.number, required this.password});
}
