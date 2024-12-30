import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginControl = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Account',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 3),
              const Text(
                'Login with your email and password',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),
              Form(
                key: loginControl.formLogin,
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginControl.usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        filled: true,
                        prefixIcon: Icon(Icons.person_rounded),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your username';
                        }
                        return null;
                      },
                      maxLength: 20,
                    ),
                    const SizedBox(height: 16),
                    GetBuilder<LoginController>(
                      builder: (_) => TextFormField(
                        controller: loginControl.passController,
                        obscureText: loginControl.obscurePass,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          filled: true,
                          prefixIcon: const Icon(Icons.password_rounded),
                          suffixIcon: GestureDetector(
                            onTap: () => loginControl.onObscurePass(),
                            child: Icon(
                              loginControl.obscurePass
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        maxLength: 20,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (loginControl.formLogin.currentState!.validate()) {
                            loginControl.loginAccount().then((success) {
                              if (success) {
                                Get.snackbar(
                                  'Login Success',
                                  'You have successfully logged in!',
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else {
                                Get.snackbar(
                                  'Login Failed',
                                  'Invalid username or password.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text('Login Now'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
