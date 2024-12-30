import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formLogin = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool obscurePass = true;

  void onObscurePass() {
    obscurePass = !obscurePass;
    update();
  }

  Future<bool> loginAccount() async {
    Map<String, dynamic> result = await LoginService.fetchLoginAccount(
      username: usernameController.text,
      password: passController.text,
    );
    if (result['status']) {
      Get.offNamed('/home', arguments: {
        'username': usernameController.text,
        'password': passController.text,
      });
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    // Reset data login
    usernameController.clear();
    passController.clear();

    // Navigasi ke halaman login
    Get.offAllNamed('/login');
  }
}
