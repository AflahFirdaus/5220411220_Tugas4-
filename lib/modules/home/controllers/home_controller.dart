import 'package:flutter_application_1/services/home_service.dart';

class HomeController {
  // Fungsi untuk memanggil HomeService dan mendapatkan data
  Future<List<dynamic>> fetchData(String username, String password) async {
    try {
      return await HomeService.fetchLoginAccount(
        username: username,
        password: password,
      );
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
