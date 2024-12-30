import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/register/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final registerControl = Get.find<RegisterController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Account',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register Now',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'Complete the form to register',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: registerControl.fromRegister,
                child: Column(
                  children: [
                    TextFormField(
                      controller: registerControl.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email_rounded,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 30,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: registerControl.usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person_rounded,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your username';
                        }
                        return null;
                      },
                      maxLength: 20,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder(
                      init: registerControl,
                      builder: (_) => TextFormField(
                        controller: registerControl.passController,
                        obscureText: registerControl.obscurePass,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => registerControl.OnObscurePass(action: 10),
                            child: Icon(
                              registerControl.obscurePass
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
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
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder(
                      init: registerControl,
                      builder: (_) => TextFormField(
                        controller: registerControl.confirmPassController,
                        obscureText: registerControl.obscureConfirmPass,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Enter confirm password',
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => registerControl.onObscureConfirmPass(action: 20),
                            child: Icon(
                              registerControl.obscureConfirmPass
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter confirm password';
                          } else if (value !=
                              registerControl.passController.text) {
                            return "Confirm password doesn't match!";
                          }
                          return null;
                        },
                        maxLength: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder(
                      init: registerControl,
                      builder: (_) => DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Choose role'),
                        value: registerControl.selectedRole,
                        items: const [
                          DropdownMenuItem(
                            value: 'admin',
                            child: Text(
                              'Admin',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'user',
                            child: Text(
                              'User',
                            ),
                          ),
                        ],
                        onChanged: (value) =>
                            registerControl.onChangeRole(value: value!),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (registerControl.fromRegister.currentState!
                              .validate()) {
                            registerControl.registerAccount();
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
                        child: const Text('Register Now'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
