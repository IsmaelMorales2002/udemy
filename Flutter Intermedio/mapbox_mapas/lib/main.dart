import 'package:flutter/material.dart';
import 'package:mapbox_mapas/src/views/fullscreenmap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mapas',
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        body: FullScreenMap()
        ),
      );
  }
}