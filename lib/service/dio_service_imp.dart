import 'package:app_film/service/dio_service.dart';
import 'package:dio/dio.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org/4/",
        headers: {
          // 'content-type': 'application/json;charset=utf-8',
          'authorization':
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTEwMDdjOGFlM2M2ZGIzM2M4N2I1MDM1MmQyMzNkYSIsInN1YiI6IjYzZThmMTIxYTJlNjAyMDA4NTM1MGMwMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cUFPUu9xakXdLFsUtliDB82Tsjp7Ey7z6ZgM8m9y9Ds"
        },
      ),
    );
  }
}
