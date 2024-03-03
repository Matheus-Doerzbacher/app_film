// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:app_film/decorators/movies_repository_decorator.dart';
import 'package:app_film/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(super.moviesRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getIncache();
    }
  }

  _saveInCache(Movies movies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print('Salvou no cache os filmes' + jsonMovies);
  }

  Future<Movies> _getIncache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = Movies.fromJson(json);
    print('Recuperou do cache os filmes' + movies.toString());
    return movies;
  }
}
