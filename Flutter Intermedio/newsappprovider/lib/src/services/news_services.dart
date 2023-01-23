import 'package:flutter/material.dart';
import 'package:newsappprovider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'c972c1a320de44a98db83d3cc6ab4660';

class NewsService extends ChangeNotifier{

  List<Article> headlines = [];

  NewsService(){

    this.getTopHeadlines();
  }

  getTopHeadlines() async{
    
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ca';
    final resp = await http.get(Uri.parse(url));

    final newsReponse = newsReponseFromJson(resp.body);
    
    headlines.addAll(newsReponse.articles);
    notifyListeners();
  }

}