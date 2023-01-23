import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_reponse.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey = 'c954275847590dfe5b0c2827e00f703a';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-Es';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  Map<int,List<Cast>> movieCast = {};

  MoviesProvider(){
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endponit, [int page = 1]) async{
    final url =
      Uri.https(_baseUrl, endponit, {
        'api_key'  : _apiKey,
        'language' : _language,
        'page'     : '$page'
        });

  // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }


  getOnDisplayMovies() async{
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingReponse = NowPlayingReponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingReponse.results;
    notifyListeners();
  }

  getPopularMovies() async{
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular',_popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies,...popularResponse.results];
    notifyListeners();
  }

  Future <List<Cast>> getMovieCast(int movieId) async{

    if(movieCast.containsKey(movieId)) return movieCast[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits',_popularPage);
    final creditsReponse = CreditResponse.fromJson(jsonData);

    movieCast[movieId] = creditsReponse.cast;
    return creditsReponse.cast;
  }

  Future <List<Movie>> searchMovie(String query) async{
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key'  : _apiKey,
      'language' : _language,
      'query'     : query
    });

     final response = await http.get(url);
     final searchReponse = SearchReponse.fromJson(response.body);

     return searchReponse.results;
  }
  
}