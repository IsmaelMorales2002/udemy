import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape(){
    final ramdon = Random();
    _width = ramdon.nextInt(300).toDouble()+70;
    _height = ramdon.nextInt(300).toDouble()+70;
    _color = Color.fromARGB(
      ramdon.nextInt(255),
      ramdon.nextInt(255),
      ramdon.nextInt(255),
      1);
    _borderRadius = BorderRadius.circular(ramdon.nextInt(100).toDouble()+10);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
         child: AnimatedContainer(
           duration: const Duration(microseconds: 400),
           curve: Curves.easeOutCubic,
           height: _height,
           width: _width,
           decoration: BoxDecoration(
             color: _color,
             borderRadius: _borderRadius
           ),
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_circle_outline_outlined,size: 25,),
      ),
    );
  }
}