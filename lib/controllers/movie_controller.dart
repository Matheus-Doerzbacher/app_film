import 'package:app_film/models/movies_model.dart';
import 'package:app_film/repositories/movies_repository.dart';
import 'package:flutter/material.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
