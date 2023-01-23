import 'package:flutter/material.dart';
import 'package:newsappprovider/src/pages/tabs_page.dart';
import 'package:newsappprovider/src/services/news_services.dart';
import 'package:newsappprovider/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create:  (_) => NewsService()
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: const TabsScreen()
      ),
    );
  }
}