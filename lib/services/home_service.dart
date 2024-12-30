import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class HomeService {
  static final Dio _dio = Dio();
  static const _baseUrl = 'http://192.168.0.147/aplikasilogin';

  // Fungsi untuk login dan fetch data
  static Future<List<dynamic>> fetchLoginAccount({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/cek_login.php',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: FormData.fromMap({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.data);
        print('Sending data: username=$username, password=$password');
        print('Response status: ${response.statusCode}');
        print('Response data: ${response.data}');
        return data['result'];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
