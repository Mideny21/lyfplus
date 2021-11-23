import 'package:flutter/material.dart';

import 'package:lyfplus_mobile/repositories/user_repository.dart';
import 'package:lyfplus_mobile/screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyft plus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(userRepository: userRepository),
    );
  }
}
