import 'package:app_film/models/movies_model.dart';
import 'package:app_film/utils/api_utils.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.overview,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.title),
                  Text(movie.originalTitle),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.new_releases),
                  Text(movie.releaseDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
