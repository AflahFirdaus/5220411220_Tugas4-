import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/register_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final fromRegister = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool obscurePass = true;
  bool obscureConfirmPass = true;

  String selectedRole = 'admin';

  void OnObscurePass({required int action}) {
    if (action == 10) {
      obscurePass = !obscurePass;
    } else {
      obscureConfirmPass = !obscureConfirmPass;
    }
    update();
  }

  void onChangeRole({required String value}) {
    selectedRole = value;
    update();
  }

  Future<void> registerAccount() async {
    bool result = await RegisterService.fetchingRagisterAccount(
      email: emailController.text,
      username: usernameController.text,
      password: passController.text,
      role: selectedRole,
    );

    if (result) {
      Get.snackbar(
        'Success',
        'Account successfully registered!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed('/login');
    } else {
      Get.snackbar(
        'Error',
        'Failed to register account. Check your input or try again later.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  onObscureConfirmPass({required int action}) {}
}
