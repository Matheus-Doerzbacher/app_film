import 'package:app_film/models/movies_model.dart';
import 'package:app_film/repositories/movies_repository.dart';
import 'package:app_film/service/dio_service.dart';
import 'package:app_film/utils/api_utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
