import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:lyfplus_mobile/constants/api_constants.dart';
import 'package:lyfplus_mobile/repositories/models/auth.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

class UserApiClient {
  static const baseUrl = ApiConstants.BASE_URL;
  // static final userName = Prefer.prefs.getString('userName');
  final http.Client httpClient;

  UserApiClient({http.Client httpClient})
      : httpClient = httpClient ?? http.Client();

  Future<Auth> login({String email, String password}) async {
    final loginUrl = '$baseUrl/login';
    final loginResponse = await this.httpClient.post(
          Uri.parse(loginUrl),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
          body: jsonEncode(
            <String, String>{
              'email': email,
              'password': password,
            },
          ),
        );
    print(loginResponse.statusCode);
    if (loginResponse.statusCode != 200) {
      throw Exception('Invalid Credentials');
    }

    final loginJson = jsonDecode(loginResponse.body);
    print(loginJson);
    return Auth.fromJson(loginJson);
  }
}
