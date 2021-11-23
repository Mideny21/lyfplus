import 'dart:io';

class ApiConstants {
  static const BASE_URL = 'http://10.0.3.2:8000/api/';
}

Map<String, String> requestHeaders(String token) {
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token'
  };
}
