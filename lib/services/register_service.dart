import 'dart:io';
import 'package:dio/dio.dart';

class RegisterService {
  static final Dio _dio = Dio();
  static const _baseUrl = 'http://192.168.0.147/aplikasilogin/create_login.php';
  static const _login = 'create_login.php';

  static Future<bool> fetchingRagisterAccount(
      {required String email,
      required String username,
      required String password,
      required String role}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/$_login',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: FormData.fromMap({
          'email': email,
          'username': username,
          'password': password,
          'role': role,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
