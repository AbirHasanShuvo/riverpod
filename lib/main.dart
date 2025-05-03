import 'package:flutter/material.dart';
import 'package:riverpod_v2/screens/home/home_screen.dart';
import 'package:riverpod_v2/test/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: MaterialApp(home: Test()),
    );
  }
}
