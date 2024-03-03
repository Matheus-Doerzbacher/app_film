import 'package:app_film/models/movies_model.dart';
import 'package:app_film/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;
  MoviesRepositoryDecorator(this._moviesRepository);

  @override
  Future<Movies> getMovies() async {
    return _moviesRepository.getMovies();
  }
}
