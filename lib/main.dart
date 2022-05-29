import 'package:chat_app/constants/screen_adaption_config.dart';
import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/pages/welcome_screen/view/welcome_screen.dart';
import 'package:chat_app/shared/screen_adaption.dart';
import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
