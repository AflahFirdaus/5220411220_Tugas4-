import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/home/bindings/home_binding.dart';
import 'package:flutter_application_1/modules/home/views/home_page.dart';
import 'package:flutter_application_1/modules/login/controllers/login_controller.dart';
import 'package:flutter_application_1/modules/login/views/login_page.dart';
import 'package:flutter_application_1/modules/register/bindings/register_binding.dart';
import 'package:flutter_application_1/modules/register/views/register_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quick Note',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/register',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => LoginController());
          }),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/register',
          page: () => const RegisterPage(),
          binding: RegisterBinding(),
        ),
      ],
    );
  }
}
