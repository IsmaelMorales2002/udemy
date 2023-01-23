import 'package:diseno/screens/basic_desing.dart';
import 'package:diseno/screens/home_screen.dart';
import 'package:diseno/screens/scroll_desing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return  MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'home_screen',
      routes: {
        'basic_desing'  : (_) => const BasicDesingScreen(),
        'scroll_desing' : (_) => const ScrollScreen(),
        'home_screen'   : (_) => const HomeScreen()
      },
    );
  }
}