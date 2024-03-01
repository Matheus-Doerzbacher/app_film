import 'package:app_film/controllers/movie_controller.dart';
import 'package:app_film/models/movies_model.dart';
import 'package:app_film/repositories/movies_repository_imp.dart';
import 'package:app_film/service/dio_service_imp.dart';
import 'package:app_film/widgets/custom_list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return Visibility(
                      visible: movies != null,
                      child: Column(
                        children: [
                          Text(
                            "Movies",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 20),
                          TextField(onChanged: _controller.onChange)
                        ],
                      ),
                    );
                  }),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, i) =>
                              CustomListCardWidget(movie: movies.listMovies[i]),
                          separatorBuilder: (_, __) => const Divider(),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
