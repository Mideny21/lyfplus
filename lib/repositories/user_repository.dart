import 'dart:io';

import 'package:lyfplus_mobile/services/user_api_client.dart';

import 'models/auth.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({UserApiClient userApiClient})
      : userApiClient = userApiClient ?? UserApiClient();

  Future<Auth> loginWithCredentials(String email, String password) async {
    return userApiClient.login(email: email, password: password);
  }
}
