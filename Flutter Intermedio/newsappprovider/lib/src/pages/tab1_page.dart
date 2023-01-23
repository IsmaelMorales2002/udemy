import 'package:flutter/material.dart';
import 'package:newsappprovider/src/services/news_services.dart';
import 'package:newsappprovider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tap1Screen extends StatelessWidget {
   
  const Tap1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsService>(context).headlines;
    // newsServices.headlines;
    return Scaffold(
      body: ListaNoticias(newsServices)
    );
  }
}