import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDieNumber = 1;
  int rightDieNumber = 1;

  void setDiceNumbers() {
    setState(() {
      leftDieNumber = Random().nextInt(6) + 1;
      rightDieNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          dieButton(leftDieNumber),
          dieButton(rightDieNumber),
        ],
      ),
    );
  }

  Widget dieButton(int faceValue) {
    return Expanded(
      child: TextButton(
        onPressed: () => setDiceNumbers(),
        child: Image.asset('images/dice$faceValue.png'),
      ),
    );
  }
}
