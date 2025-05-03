import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('this is test screen')),
      body: Center(child: Image.asset('assets/icons/backpack.png')),
    );
  }
}
