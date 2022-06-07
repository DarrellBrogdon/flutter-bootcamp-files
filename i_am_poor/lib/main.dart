import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('I Am Poor'),
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/icons8-empty-60.png'),
        ),
      ),
    ),
  ));
}
