import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/home/controllers/home_controller.dart';
import 'package:flutter_application_1/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _loginController = Get.find<LoginController>();
  final _homeController = HomeController();
  String pageTitle = 'Home Page';
  List<dynamic> apiData = [];

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    final username = args['username'];
    final password = args['password'];
    _loadData(username, password);
  }

  Future<void> _loadData(String username, String password) async {
    try {
      final data = await _homeController.fetchData(username, password);
      setState(() {
        apiData = data;
        pageTitle = 'Welcome, $username!';
      });
    } catch (e) {
      setState(() {
        pageTitle = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: [
          IconButton(
            onPressed: () {
              // Trigger fungsi logout
              _loginController.logout();
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: apiData.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: apiData.length,
                  itemBuilder: (context, index) {
                    final item = apiData[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.indigo,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          item['username'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          item['role'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Text(
                          item['email'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
