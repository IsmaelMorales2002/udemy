import 'package:bandnamesapp/pages/home.dart';
import 'package:bandnamesapp/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/status.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,  
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home' : (_) => const HomePage(),
          'status' : (_) => StatusPage()
        },
      ),
    );
  }
}