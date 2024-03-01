import 'package:app_film/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
