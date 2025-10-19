import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double heidth = 50;
  double radius = 10.0;
  Color color = Colors.indigo;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120;
    heidth = random.nextInt(600) + 120;
    radius = random.nextInt(100) + 20;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated screen')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInSine,
          width: width <= 0 ? 0 : width,
          height: heidth <= 0 ? 0 : heidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(radius < 0 ? 0 : radius),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
