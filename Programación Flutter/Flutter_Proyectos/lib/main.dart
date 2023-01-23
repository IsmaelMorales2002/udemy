import 'package:flutter/material.dart';
import 'package:flutter_proyectos/src//pages/home/home_page.dart';
import 'package:flutter_proyectos/src/pages/client/map/client_map_page.dart';
import 'package:flutter_proyectos/src/pages/driver/map/driver_map_page.dart';
import 'package:flutter_proyectos/src/pages/driver/register/driver_register_page.dart';
import 'package:flutter_proyectos/src/pages/login/login_page.dart';
import 'package:flutter_proyectos/src//utils/colors.dart' as utils;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_proyectos/src/pages/client/register/client_register_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shi Bi",
      initialRoute: 'home',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: utils.Colors.ColorPrimario
        ),
        primaryColor: utils.Colors.ColorPrimario,
      ),
      routes: {
        'home':(BuildContext context) => HomePage(),
        'login':(BuildContext context) => LoginPage(),
        'client/register':(BuildContext context) => ClientRegisterPage(),
        'driver/register':(BuildContext context) => DriverRegisterPage(),
        'driver/map':(BuildContext context) => DriverMapPage(),
        'client/map':(BuildContext context) => ClientMapPage(),
      },
    );
  }
}
