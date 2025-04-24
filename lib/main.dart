import 'package:flutter/material.dart';
import 'package:riverpod_v2/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MaterialApp(home: HomeScreen()),
    );
  }
}
