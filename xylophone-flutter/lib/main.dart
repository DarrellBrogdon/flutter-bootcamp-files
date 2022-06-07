import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<Expanded> allKeys = [];

  final Map<int, Color> keys = {
    1: Colors.red,
    2: Colors.orange,
    3: Colors.yellow,
    4: Colors.green,
    5: Colors.teal,
    6: Colors.blue,
    7: Colors.purple
  };

  XylophoneApp() {
    keys.forEach((key, value) {
      allKeys.add(buildKey(soundNumber: key, keyColor: value));
    });
  }

  Expanded buildKey({int soundNumber: 1, Color keyColor: Colors.grey}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        ),
        onPressed: () {
          AudioCache().play('note$soundNumber.wav');
        },
        child: Container(
          color: keyColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: allKeys,
          ),
        ),
      ),
    );
  }
}
