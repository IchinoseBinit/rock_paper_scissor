import 'package:flutter/material.dart';
import '/screens/choose_option_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChooseOptionScreen(),
    );
  }
}
