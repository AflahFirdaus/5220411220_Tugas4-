import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/user_model.dart';

class LoginService {
  static final Dio _dio = Dio();
  static const _baseUrl = 'http://192.168.0.147/aplikasilogin/cek_login.php';
  static const _login = 'cek_login.php';

  static Future<Map<String, dynamic>> fetchLoginAccount(
      {required String username, required String password}) async {
    try {
      final response = await _dio.post('$_baseUrl/$_login',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: FormData.fromMap({
            'username': username,
            'password': password,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic data = jsonDecode(response.data);
        UserModel user = UserModel.fromJson(json: data['result'][0]);
        return {'status': true, 'user': user};
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
