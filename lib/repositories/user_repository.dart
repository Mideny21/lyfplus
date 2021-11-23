import 'dart:io';

import 'package:tweety_mobile/models/auth.dart';
import 'package:tweety_mobile/models/user.dart';
import 'package:tweety_mobile/preferences/preferences.dart';
import 'package:tweety_mobile/services/user_api_client.dart';

import 'models/auth.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({UserApiClient userApiClient})
      : userApiClient = userApiClient ?? UserApiClient();

  Future<Auth> loginWithCredentials(String email, String password) async {
    return userApiClient.login(email: email, password: password);
  }

  Future<Auth> register(
    String name,
    String username,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    // String fcmToken = await getFcmtoken();

    return userApiClient.register(
      name: name,
      username: username,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  Future<User> getAuthUserInfo() async {
    return userApiClient.fetchAuthInfo();
  }
}
