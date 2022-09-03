import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String title;

  const SecondPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}